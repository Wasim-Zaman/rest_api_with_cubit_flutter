import '../models/image_model.dart';

abstract class ImageStates {}

class ImageInitial extends ImageStates {}

class ImageExceptionState extends ImageStates {
  final String message;

  ImageExceptionState(this.message);
}

class ImageLoadedState extends ImageStates {
  final List<ImagesModel> images;
  ImageLoadedState(this.images);
}
