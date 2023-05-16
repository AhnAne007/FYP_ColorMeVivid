import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

typedef PointMoveCallback = void Function(Offset offset, Key? key);

class DraggableEquipment extends StatelessWidget {
  final Widget child;
  final VoidCallback onDragStart;
  final PointMoveCallback onDragEnd;
  final PointMoveCallback onDragUpdate;
  const DraggableEquipment({super.key, required this.child, required this.onDragStart, required this.onDragEnd, required this.onDragUpdate});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    late Offset offset;
    return Listener(
      onPointerMove: (event){
        offset = event.position;
        onDragUpdate(event.position, key);
      },
      child: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm)
        {
          notifier.value = m;
        },
        onScaleStart: () {
          onDragStart();
        },
        onScaleEnd: () {
          onDragEnd(offset, key);
        },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, childWidget)
          {
            return Transform(
              transform: notifier.value,
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}