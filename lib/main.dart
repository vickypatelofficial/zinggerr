import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zinggerr/blocs/login/login_bloc.dart';
import 'package:zinggerr/config/app_theme.dart';
import 'package:zinggerr/screens/auth/login_screen.dart';
import 'package:zinggerr/screens/bottom_bar_screen.dart';
import 'package:zinggerr/screens/dashboard/dashboard_screen.dart';
import 'package:zinggerr/screens/user/user_list_screen.dart';

void main() {
  runApp(const MyApp());
}

double screenHeight = 0;
double screenWidth = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: RAppTheme.lightTheme, // Apply the custom light theme
        darkTheme: RAppTheme.lightTheme, // Apply the custom dark theme
        themeMode: ThemeMode.system, // Use the current theme mode from provider
        home: const LoginScreen(),
      ), 
    );
  }
}