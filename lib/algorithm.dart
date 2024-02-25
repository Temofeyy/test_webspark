import 'dart:async';
import 'dart:collection';

import 'models/point.dart';

class ShortestPathFinder {
  final List<AlgorithmTask> tasks;

  final _progressController = StreamController<double>();
  Stream<double> get progress => _progressController.stream;

  late int _availablePointCount;
  int _getAvailablePointCount() {
    var count = 0;
    for(final t in tasks)
      for (final i in t.matrix) {
        for (final j in i) {
          if (j == 1) count++;
        }
      }
    return count;
  }
  int processedNodes = 0;

  int processedTask = 0;

  ShortestPathFinder(this.tasks){
    _availablePointCount = _getAvailablePointCount();
  }


  /// Return path of next task (0-tasks.length)
  List<Point> next(){
    if(processedTask == tasks.length) return [];


    final current = tasks[processedTask];
    processedTask ++;
    return _findShortestPath(current.matrix, current.start, current.end);
  }

  

  List<Point> _findShortestPath(List<List<int>> matrix, Point start, Point end) {
    final queue = Queue<Point>();
    final parent = <Point, Point?>{};

    queue.add(start);

    parent[start] = null;

    while (queue.isNotEmpty) {
      final current = queue.removeFirst();
      if (current == end) {
        if(processedTask == tasks.length){
          _progressController.add(1);

        }
        return _reconstructPath(parent, start, end);
      }

      final neighbors = _getNeighbors(matrix, current);

      for (final neighbor in neighbors) {
        if (!parent.containsKey(neighbor)) {
          queue.add(neighbor);
          parent[neighbor] = current;
        }
      }
      processedNodes++;
      final percentComplete = processedNodes / _availablePointCount;
      _progressController.add(percentComplete);
    }
    return [];
  }

  List<Point> _reconstructPath(Map<Point, Point?> parent, Point start, Point end) {
    var path = <Point>[];
    Point? current = end;

    while (current != null) {
      path.add(current);
      current = parent[current];
    }

    path = path.reversed.toList();

    return path;
  }

  List<Point> _getNeighbors(List<List<int>> matrix, Point point) {
    final neighbors = <Point>[];

    for (var i = -1; i <= 1; i++) {
      for (var j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) continue;
        final newX = point.x + i;
        final newY = point.y + j;

        if (newX >= 0 &&
            newX < matrix.length &&
            newY >= 0 &&
            newY < matrix.length &&
            matrix[newX][newY] == 1) {
          neighbors.add(Point(newX, newY));
        }
      }
    }

    return neighbors;
  }
}


class AlgorithmTask {
  final List<List<int>> matrix;
  final Point start;
  final Point end;

  AlgorithmTask(this.matrix, this.start, this.end);
}