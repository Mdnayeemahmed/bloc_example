import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/counter/counter_bloc.dart';
import 'package:untitled5/bloc/fav_app/fav_app_bloc.dart';
import 'package:untitled5/bloc/image_picker/image_picker__bloc.dart';
import 'package:untitled5/bloc/posts/posts_bloc.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_bloc.dart';
import 'package:untitled5/bloc/todo/todo_bloc.dart';
import 'package:untitled5/repo/fav_repo.dart';
import 'package:untitled5/ui/ToDo/to_do_screen.dart';
import 'package:untitled5/ui/authentication/login.dart';
import 'package:untitled5/ui/counter/counter_screen.dart';
import 'package:untitled5/ui/fav_app/fav_app_screen.dart';
import 'package:untitled5/ui/image_picker/image_picker_screen.dart';
import 'package:untitled5/ui/post/post_screen.dart';
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
        BlocProvider(
          create: (_) => SwitchExampleBloc(),
        ),
        BlocProvider(
          create: (_) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (_) => TodoBloc(),
        ),
        BlocProvider(
          create: (_) => FavAppBloc(FavRepo()),
        ),
        BlocProvider(
          create: (_) => PostsBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
