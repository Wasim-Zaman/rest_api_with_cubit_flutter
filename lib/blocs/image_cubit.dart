import 'package:flutter_bloc/flutter_bloc.dart';

import './image_states.dart';
import './image_repository.dart';

class ImageCubit extends Cubit<ImageStates> {
  final ImageRepository imageRepository;
  ImageCubit(this.imageRepository) : super(ImageInitial()) {
    imageRepository.getModel().then((value) {
      emit(ImageLoadedState(value));
    }).catchError((error) {
      emit(ImageExceptionState(error.toString()));
    });
  }
}
