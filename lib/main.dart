import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:task_management_app/Theme/app_theme.dart';
import 'package:task_management_app/View/Screens/add_task_screen.dart';
import 'package:task_management_app/View/Screens/completed_tasks_screen.dart';
import 'package:task_management_app/Services/notification_service.dart';
import 'package:task_management_app/View/Screens/Auth/login_screen.dart';
import 'package:task_management_app/View/Screens/Auth/reset_pass_screen.dart';
import 'package:task_management_app/View/Screens/Auth/signup_screen.dart';
import 'package:task_management_app/View/Screens/main_screen.dart';
import 'package:task_management_app/View/Screens/settings_screen.dart';
import 'package:task_management_app/View/Screens/splash_screen.dart';
import 'package:task_management_app/View/Screens/task_screen.dart';
import 'package:task_management_app/View/Screens/uncompleted_tasks_screen.dart';
import 'package:task_management_app/ViewModel/locale_provider.dart';
import 'package:task_management_app/ViewModel/notification_provider.dart';
import 'package:task_management_app/ViewModel/task_provider.dart';
import 'package:task_management_app/ViewModel/theme_provider.dart';
import 'package:task_management_app/ViewModel/user_data_provider.dart';
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
        ChangeNotifierProvider(create: (context) => UserDataProvider()),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..getTheme(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotificationProvider()..loadNotificationState(),
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
    final theme = Provider.of<ThemeProvider>(context).themeMode;
    return ScreenUtilInit(
      designSize: Size(390, 884),
      child: MaterialApp(
        title: "Task Management App",
        debugShowCheckedModeBanner: false,
        locale: locale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: theme,
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/resetPassword': (context) => ResetPassScreen(),
          '/main': (context) => MainScreen(),
          '/task': (context) => TaskScreen(),
          '/add_task': (context) => AddTaskScreen(),
          '/settings': (context) => SettingsScreen(),
          '/completed_tasks': (context) => CompletedTasksScreen(),
          '/uncompleted_tasks': (context) => UncompletedTasksScreen(),
        },

        initialRoute: '/splash',
      ),
    );
  }
}
