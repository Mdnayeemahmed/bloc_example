import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/counter/counter_bloc.dart';
import 'package:untitled5/bloc/image_picker/image_picker__bloc.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_bloc.dart';
import 'package:untitled5/ui/image_picker/image_picker_screen.dart';
import 'package:untitled5/ui/utils/image_picker_utils.dart';

import 'ui/switch/switch_example_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SwitchExampleBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
