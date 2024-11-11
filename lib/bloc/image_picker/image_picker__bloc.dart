import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled5/ui/utils/image_picker_utils.dart';

import 'image_picker__event.dart';
import 'image_picker__state.dart';



class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<ImagePickFromGallery>(galleryPick);
  }


  Future<void> cameraCapture(CameraCapture event,Emitter<ImagePickerState> states) async {
    XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
  Future<void> galleryPick(ImagePickFromGallery event,Emitter<ImagePickerState> states) async {
    XFile? file=await imagePickerUtils.gallaryCapture();
    emit(state.copyWith(file: file));
  }
}
