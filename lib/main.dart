import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/view/home/cubit/home_cubit.dart';
import 'package:mini_social_app/view/home/cubit/home_states.dart';
import 'package:mini_social_app/view/login/login_screen.dart';
import 'core/network/dio_helper.dart';


void main() {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit(InitialHomeState())..getPost(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  LoginScreen(),
      ),
    );
  }
}

