import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/dio_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_cubit.dart';
import 'package:happy_tech_mastering_api_with_flutter/repositories/user_repo.dart';
import 'package:happy_tech_mastering_api_with_flutter/screens/sign_in_screen.dart';
import 'package:happy_tech_mastering_api_with_flutter/utilities/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs= await SharedPreferences.getInstance();

  runApp(
    BlocProvider(
      create: (context) => UserCubit(UserRepo(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: (settings) => onGenerateRoute(settings),

      home: SignInScreen(),
    );
  }
}
