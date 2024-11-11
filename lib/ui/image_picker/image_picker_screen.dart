import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/image_picker/image_picker__bloc.dart';
import 'package:untitled5/bloc/image_picker/image_picker__event.dart';
import 'package:untitled5/bloc/image_picker/image_picker__state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker Bloc"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
          if (state.file == null) {
            return InkWell(
              onTap: () {
                context.read<ImagePickerBloc>().add(CameraCapture());
              },
              child: CircleAvatar(
                child: Icon(Icons.camera),
              ),
            );
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        }),
      ),
    );
  }
}
