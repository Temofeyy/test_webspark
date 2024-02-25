import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../models/task_with_result.dart';

@RoutePage()
class ResultDetailsPage extends StatelessWidget {
  final TaskWithResult taskWithResult;

  const ResultDetailsPage({super.key, required this.taskWithResult});

  _Cell _buildCell(int index) {
    final row = index ~/ taskWithResult.matrixSize;
    final col = index % taskWithResult.matrixSize;

    final cellType = _CellType.byCode(taskWithResult.matrix[row][col]);
    return _Cell(type: cellType, point: '($row,$col)');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview screen'),
      ),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: taskWithResult.matrixSize * taskWithResult.matrixSize,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: taskWithResult.matrixSize,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemBuilder: (_, index) => _buildCell(index),
          ),
          const SizedBox(height: 24),
          Text(taskWithResult.resultPath),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final _CellType type;
  final String point;
  const _Cell({super.key, required this.type, required this.point});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: type.color,
      child: Center(
        child: Text(point, style: TextStyle(color: type.textColor)),
      ),
    );
  }
}

enum _CellType {
  Start(0xFF64FFDA),
  End(0xFF009688),
  Blocked(0xFF000000),
  Path(0xFF4CAF50),
  Empty(0xFFFFFFFF);

  final int hexColor;

  Color get color => Color(hexColor);

  Color get textColor => switch (this) {
        _CellType.Empty || _CellType.Start => Colors.black,
        _ => Colors.white,
      };

  static _CellType byCode(int code) => switch (code) {
        0 => _CellType.Blocked,
        2 => _CellType.Start,
        3 => _CellType.End,
        5 => _CellType.Path,
        _ => _CellType.Empty
      };

  const _CellType(this.hexColor);
}
