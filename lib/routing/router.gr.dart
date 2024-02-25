// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CalculationRoute.name: (routeData) {
      final args = routeData.argsAs<CalculationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CalculationPage(
          key: args.key,
          tasks: args.tasks,
        ),
      );
    },
    FetchTasksRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FetchTasksPage(),
      );
    },
    ResultDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ResultDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultDetailsPage(
          key: args.key,
          taskWithResult: args.taskWithResult,
        ),
      );
    },
    ResultListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResultListPage(),
      );
    },
  };
}

/// generated route for
/// [CalculationPage]
class CalculationRoute extends PageRouteInfo<CalculationRouteArgs> {
  CalculationRoute({
    Key? key,
    required List<Task> tasks,
    List<PageRouteInfo>? children,
  }) : super(
          CalculationRoute.name,
          args: CalculationRouteArgs(
            key: key,
            tasks: tasks,
          ),
          initialChildren: children,
        );

  static const String name = 'CalculationRoute';

  static const PageInfo<CalculationRouteArgs> page =
      PageInfo<CalculationRouteArgs>(name);
}

class CalculationRouteArgs {
  const CalculationRouteArgs({
    this.key,
    required this.tasks,
  });

  final Key? key;

  final List<Task> tasks;

  @override
  String toString() {
    return 'CalculationRouteArgs{key: $key, tasks: $tasks}';
  }
}

/// generated route for
/// [FetchTasksPage]
class FetchTasksRoute extends PageRouteInfo<void> {
  const FetchTasksRoute({List<PageRouteInfo>? children})
      : super(
          FetchTasksRoute.name,
          initialChildren: children,
        );

  static const String name = 'FetchTasksRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultDetailsPage]
class ResultDetailsRoute extends PageRouteInfo<ResultDetailsRouteArgs> {
  ResultDetailsRoute({
    Key? key,
    required TaskWithResult taskWithResult,
    List<PageRouteInfo>? children,
  }) : super(
          ResultDetailsRoute.name,
          args: ResultDetailsRouteArgs(
            key: key,
            taskWithResult: taskWithResult,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultDetailsRoute';

  static const PageInfo<ResultDetailsRouteArgs> page =
      PageInfo<ResultDetailsRouteArgs>(name);
}

class ResultDetailsRouteArgs {
  const ResultDetailsRouteArgs({
    this.key,
    required this.taskWithResult,
  });

  final Key? key;

  final TaskWithResult taskWithResult;

  @override
  String toString() {
    return 'ResultDetailsRouteArgs{key: $key, taskWithResult: $taskWithResult}';
  }
}

/// generated route for
/// [ResultListPage]
class ResultListRoute extends PageRouteInfo<void> {
  const ResultListRoute({List<PageRouteInfo>? children})
      : super(
          ResultListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResultListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
