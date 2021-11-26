import 'dart:io';

import 'package:camera_camera_2/src/core/camera_bloc.dart';
import 'package:flutter/material.dart';

class FlipCamera extends StatelessWidget {
  const FlipCamera({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final CameraBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.6),
          ),
          child: IconButton(
            onPressed: () {
              bloc.changeCamera();
            },
            icon: Icon(
              Platform.isAndroid
                  ? Icons.flip_camera_android
                  : Icons.flip_camera_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
