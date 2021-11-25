import 'package:camera_camera/src/presentation/controller/camera_camera_controller.dart';
import 'package:camera_camera/src/presentation/controller/camera_camera_status.dart';
import 'package:flutter/material.dart';
import 'floating_buttons/zoom_button.dart';
import 'floating_buttons/capture_button.dart';
import 'floating_buttons/flash_button.dart';

class CameraCameraPreview extends StatefulWidget {
  final void Function(String value)? onFile;
  final CameraCameraController controller;
  final bool enableZoom;
  CameraCameraPreview({
    Key? key,
    this.onFile,
    required this.controller,
    required this.enableZoom,
  }) : super(key: key);

  @override
  _CameraCameraPreviewState createState() => _CameraCameraPreviewState();
}

class _CameraCameraPreviewState extends State<CameraCameraPreview> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CameraCameraStatus>(
      valueListenable: widget.controller.statusNotifier,
      builder: (_, status, __) => status.when(
          success: (camera) => GestureDetector(
                onScaleUpdate: (details) {
                  widget.controller.setZoomLevel(details.scale);
                },
                child: Stack(
                  children: [
                    Center(child: widget.controller.buildPreview()),
                    if (widget.controller.flashModes.length > 1)
                      FlashButton(
                        flashIcon: camera.flashModeIcon,
                        controller: widget.controller,
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.enableZoom)
                          ZoomButton(
                              controller: widget.controller,
                              zoomLevel: camera.zoom),
                        CaptureButton(controller: widget.controller),
                      ],
                    ),
                  ],
                ),
              ),
          failure: (message, _) => Container(
                color: Colors.black,
                child: Text(message),
              ),
          orElse: () => Container(
                color: Colors.black,
              )),
    );
  }
}
