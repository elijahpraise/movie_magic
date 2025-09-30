import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_magic/app/app_index.dart';
import 'package:movie_magic/features/shared/presentation/blocs_provider.dart';
import 'package:movie_magic/navigation/navigation_index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocsProvider,
      child: MaterialApp.router(
        title: AppConstants.appName,
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          textTheme: textTheme,
        ),
      ),
    );
  }
}

TextTheme textTheme = TextTheme(
  displayLarge: GoogleFonts.montserrat(
    fontWeight: FontWeight.bold,
    fontSize: 32,
  ),
  displaySmall: GoogleFonts.montserrat(
    fontWeight: FontWeight.normal,
    fontSize: 16,
  ),
  headlineLarge: GoogleFonts.raleway(fontWeight: FontWeight.w700),
  headlineMedium: GoogleFonts.raleway(fontWeight: FontWeight.w600),
  headlineSmall: GoogleFonts.raleway(fontWeight: FontWeight.w500),
  bodyLarge: GoogleFonts.poppins(),
  bodyMedium: GoogleFonts.poppins(),
  bodySmall: GoogleFonts.nunitoSans(),
);
