import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/task_with_result.dart';
import '../routing/router.dart';
import '../utils/user_storage.dart';

@RoutePage()
class ResultListPage extends StatefulWidget {
  const ResultListPage({super.key});

  @override
  State<ResultListPage> createState() => _ResultListPageState();
}

class _ResultListPageState extends State<ResultListPage> {
  List<TaskWithResult> results = [];

  void loadResults() {
    results = UserStorage.getSavedResults();
  }

  @override
  void initState() {
    super.initState();
    loadResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Result list screen')),
      body: ListView.separated(
        itemCount: results.length,
        itemBuilder: (_, i) => _ResultWidget(taskWithResult: results[i]),
        separatorBuilder: (_, __) => const Divider(height: 1),
      ),
    );
  }
}

class _ResultWidget extends StatelessWidget {
  final TaskWithResult taskWithResult;

  const _ResultWidget({super.key, required this.taskWithResult});

  void openResultDetails(BuildContext context) {
    unawaited(
      AutoRouter.of(context)
          .push(ResultDetailsRoute(taskWithResult: taskWithResult)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => openResultDetails(context),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            taskWithResult.resultPath,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
