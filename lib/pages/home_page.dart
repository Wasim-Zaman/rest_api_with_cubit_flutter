import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/image_cubit.dart';
import '../blocs/image_repository.dart';
import '../blocs/image_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageCubit>(
      create: (context) => ImageCubit(ImageRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cubit'),
        ),
        body: BlocBuilder<ImageCubit, ImageStates>(
          builder: (context, state) {
            if (state is ImageInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ImageLoadedState) {
              return ListView.builder(
                itemCount: state.images.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(state.images[index].thumbnailUrl!),
                    title: Text(state.images[index].title!),
                  );
                },
              );
            } else if (state is ImageExceptionState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ),
    );
  }
}
