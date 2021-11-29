import 'package:camera_camera_2/src/presentation/controller/camera_camera_controller.dart';
import 'package:camera_camera_2/src/presentation/widgets/translucent_widget.dart';
import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({
    Key? key,
    required this.controller,
    required this.zoomLevel,
  }) : super(key: key);

  final CameraCameraController controller;
  final double zoomLevel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TranslucentButton(
          onTap: () {
            controller.zoomChange();
          },
          child: Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black.withOpacity(0.6),
            ),
            child: Text(
              "${zoomLevel.toStringAsFixed(1)}x",
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
