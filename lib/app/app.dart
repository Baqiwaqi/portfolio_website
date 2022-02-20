import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website_app/config/themes/constants.dart';
import 'package:portfolio_website_app/github/repository/github_repository.dart';
import 'package:portfolio_website_app/modules/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // wrapper for streams and changeNotifiers
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => GithubRepository(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  // root of the application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: backgroundColor,
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.white)
        //     .copyWith(
        //       subtitle2: const TextStyle(color: Colors.black),
        //       bodyText1: const TextStyle(color: Colors.black),
        //       bodyText2: const TextStyle(color: Colors.black),
        //     ),
      ),
      home: const HomeScreen(),
    );
  }
}
