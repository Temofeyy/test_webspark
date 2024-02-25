import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../models/task_with_result.dart';
import '../pages/calculation_page.dart';
import '../pages/fetch_tasks_page.dart';
import '../pages/result_details_page.dart';
import '../pages/result_list_page.dart';
part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: FetchTasksRoute.page),
    AutoRoute(path: '/calculation', page: CalculationRoute.page),
    AutoRoute(path: '/results', page: ResultListRoute.page),
    AutoRoute(path: '/results/details', page: ResultDetailsRoute.page),
  ];
}