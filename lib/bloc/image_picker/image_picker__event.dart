import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List<Object> get props => [];
}

class ImagePickFromGallery extends ImagePickerEvent {}

class CameraCapture extends ImagePickerEvent {}
