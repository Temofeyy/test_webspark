import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';
import '../mixins/loadable_page.dart';
import '../models/task.dart';
import '../routing/router.dart';
import '../utils/scaffold_message.dart';
import '../utils/user_storage.dart';
import '../widgets/async_button.dart';

@RoutePage()
class FetchTasksPage extends StatefulWidget {
  const FetchTasksPage({super.key});

  @override
  State<FetchTasksPage> createState() => _FetchTasksPageState();
}

class _FetchTasksPageState extends State<FetchTasksPage> with LoadablePage {
  late final TextEditingController controller;
  bool isButtonAvailable = false;

  @override
  bool isLoading = false;

  void initController() {
    final savedUrl = UserStorage.getSavedUrl();
    if (savedUrl != null) isButtonAvailable = true;
    controller = TextEditingController(text: savedUrl);
  }

  void setControllerListener() {
    controller.addListener(() {
      isButtonAvailable = true;
      if (controller.text.isEmpty) isButtonAvailable = false;
      setState(() {});
    });
  }

  Future<void> tryFetchTasks(BuildContext context) async {
    FocusScope.of(context).unfocus();

    if (!API.isValidUrl(controller.text)) {
      ScaffoldMessage.show(context, 'Invalid url');
      return;
    }

    setState(() => isLoading = true);
    var tasks = <Task>[];
    try{
      tasks = await API.fetchTasks(controller.text);
    } catch (e){
      if(mounted)
        ScaffoldMessage.show(context, e.toString());
      setState(() => isLoading = false);
      return;
    }
    setState(() => isLoading = false);

    UserStorage.saveUrl(controller.text);

    if (!context.mounted) return;
    unawaited(AutoRouter.of(context).push(CalculationRoute(tasks: tasks)));
  }

  @override
  void initState() {
    super.initState();
    initController();
    setControllerListener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home screen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Set valid API vase URL in order to continue'),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const Icon(Icons.compare_arrows_outlined),
                      const SizedBox(width: 16),
                      Flexible(
                        child: TextField(
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AsyncButton(
                label: 'Start counting process',
                isLoading: isLoading,
                onTap: isButtonAvailable
                    ? () async => tryFetchTasks(context)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
