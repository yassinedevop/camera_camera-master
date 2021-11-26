import 'package:camera_camera_2/src/presentation/controller/camera_camera_controller.dart';
import 'package:flutter/material.dart';

class CaptureButton extends StatelessWidget {
  const CaptureButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CameraCameraController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: InkWell(
            onTap: () {
              controller.takePhoto();
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 5)),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 5)),
              ),
            ),
          ),
        ));
  }
}
