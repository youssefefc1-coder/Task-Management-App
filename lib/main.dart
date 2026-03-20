import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_management_app/View/Screens/home_screen.dart';
import 'package:task_management_app/Services/noti_service.dart';
import 'package:task_management_app/View/Screens/Auth/login_screen.dart';
import 'package:task_management_app/View/Screens/Auth/reset_pass_screen.dart';
import 'package:task_management_app/View/Screens/Auth/signup_screen.dart';
import 'package:task_management_app/View/Screens/splash_screen.dart';
import 'package:task_management_app/View/Screens/task_screen.dart';
import 'package:task_management_app/ViewModel/locale_provider.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await NotificationService.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(
          create: (context) => LocaleProvider()..getLocale(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context).locale;
    return ScreenUtilInit(
      designSize: Size(360, 800),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: Colors.white,
            cursorColor: Colors.white,
            selectionColor: Colors.grey,
          ),
        ),
        routes: {
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/home': (context) => HomeScreen(),
          '/resetPassword': (context) => ResetPassScreen(),
          '/splash': (context) => SplashScreen(),
          '/task': (context) => TaskScreen(),
        },

        initialRoute: '/splash',
      ),
    );
  }
}
