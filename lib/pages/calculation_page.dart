import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../algorithm.dart';
import '../api/api.dart';
import '../ext.dart';
import '../mixins/loadable.dart';
import '../models/point.dart';
import '../models/task.dart';
import '../models/task_result.dart';
import '../models/task_with_result.dart';
import '../routing/router.dart';
import '../utils/scaffold_message.dart';
import '../utils/user_storage.dart';
import '../widgets/async_button.dart';

@RoutePage()
class CalculationPage extends StatefulWidget {
  final List<Task> tasks;
  const CalculationPage({super.key, required this.tasks});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> with LoadablePage {
  @override
  bool isLoading = false;

  late final ShortestPathFinder finder;

  double progressPercent = 0;
  int get prettyPercent => (progressPercent * 100).floor();
  bool get calculationFinished => progressPercent == 1;

  Map<String, List<Point>> paths = {};

  void initFinder() {
    final algorithmTasks = widget.tasks
        .map((e) => AlgorithmTask(e.matrix, e.start, e.end))
        .toList();
    
    finder = ShortestPathFinder(algorithmTasks);
    finder.progress.listen((p) => setState(() => progressPercent = p));
  }

  Future<void> startAndSaveResults() async {
    await calculate();
    final results = getResults();
    UserStorage.saveResults(results);
  }

  Future<void> calculate() async {
    ///Delay so that the state does not change immediately
    ///(For tasks of low complexity or small quantities)
    await Future<void>.delayed(const Duration(seconds: 1));

    for(final t in widget.tasks){
      paths[t.id] = finder.next();
    }
  }

  List<TaskWithResult> getResults(){
    final results = widget.tasks.map((t){
      final taskResult = Result(steps: paths[t.id]!, path: paths[t.id]!.stringPath);
      return TaskWithResult.fromJson(
        t.toJson()..addAll({'result': taskResult.toJson()}),
      );
    }).toList();

    return results;
  }

  Future<void> trySendResultToServer() async {
    setState(() => isLoading = true);

    final serverUrl = UserStorage.getSavedUrl();

    try{
      final res = await API.sendTasksResult(serverUrl!, getResults());
      if(mounted){
        unawaited(AutoRouter.of(context).push(const ResultListRoute()));
        ScaffoldMessage.show(context, 'The calculation was successfully uploaded to the server');

      }
    } catch(e) {
      if(mounted)
        ScaffoldMessage.show(context, e.toString());
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    initFinder();
    unawaited(startAndSaveResults());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Process screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    calculationFinished
                        ? 'All calculation has finished, you can send your results to server'
                        : 'Calculation',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text('$prettyPercent%'),
                  const SizedBox(height: 24),
                  SizedBox.square(
                    dimension: 150,
                    child: CircularProgressIndicator(
                      value: progressPercent,
                    ),
                  ),
                ],
              ),
            ),
            AsyncButton(
              label: 'Send results to server',
              isLoading: isLoading,
              onTap: calculationFinished
                  ? () async => trySendResultToServer()
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
