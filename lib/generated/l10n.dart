// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Organize Your Day, One Task at a Time`
  String get splash_phase {
    return Intl.message(
      'Organize Your Day, One Task at a Time',
      name: 'splash_phase',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcome Back`
  String get welcome_back {
    return Intl.message(
      'Welcome Back',
      name: 'welcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Friend`
  String get welcome_friend {
    return Intl.message(
      'Welcome Friend',
      name: 'welcome_friend',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Check your email to Verify your account`
  String get verify_msg {
    return Intl.message(
      'Check your email to Verify your account',
      name: 'verify_msg',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Field can't be empty`
  String get field_cant_be_empty {
    return Intl.message(
      'Field can\'t be empty',
      name: 'field_cant_be_empty',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Email`
  String get enter_valid_email {
    return Intl.message(
      'Enter valid Email',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get password_too_short {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'password_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.`
  String get forgot_password_msg {
    return Intl.message(
      'No problem. Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.',
      name: 'forgot_password_msg',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get your_email {
    return Intl.message('Your Email', name: 'your_email', desc: '', args: []);
  }

  /// `Or Login`
  String get or_login {
    return Intl.message('Or Login', name: 'or_login', desc: '', args: []);
  }

  /// `Or Sign up`
  String get or_signup {
    return Intl.message('Or Sign up', name: 'or_signup', desc: '', args: []);
  }

  /// `enter email`
  String get enter_email {
    return Intl.message('enter email', name: 'enter_email', desc: '', args: []);
  }

  /// `enter password`
  String get enter_password {
    return Intl.message(
      'enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Have an account?`
  String get have_account {
    return Intl.message(
      'Have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get login_with_google {
    return Intl.message(
      'Login with Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Google`
  String get signup_with_google {
    return Intl.message(
      'Sign up with Google',
      name: 'signup_with_google',
      desc: '',
      args: [],
    );
  }

  /// `No Tasks`
  String get no_tasks {
    return Intl.message('No Tasks', name: 'no_tasks', desc: '', args: []);
  }

  /// `Tasks`
  String get tasks {
    return Intl.message('Tasks', name: 'tasks', desc: '', args: []);
  }

  /// `Open`
  String get open {
    return Intl.message('Open', name: 'open', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `All Tasks`
  String get all_tasks {
    return Intl.message('All Tasks', name: 'all_tasks', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Not Completed`
  String get not_completed {
    return Intl.message(
      'Not Completed',
      name: 'not_completed',
      desc: '',
      args: [],
    );
  }

  /// `title`
  String get title {
    return Intl.message('title', name: 'title', desc: '', args: []);
  }

  /// ` Description`
  String get description {
    return Intl.message(
      ' Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Mark as Done`
  String get mark_as_done {
    return Intl.message(
      'Mark as Done',
      name: 'mark_as_done',
      desc: '',
      args: [],
    );
  }

  /// `Title can't be Empty`
  String get title_empty_er {
    return Intl.message(
      'Title can\'t be Empty',
      name: 'title_empty_er',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message('Add', name: 'add', desc: '', args: []);
  }

  /// `Add Task`
  String get add_task {
    return Intl.message('Add Task', name: 'add_task', desc: '', args: []);
  }

  /// `Update Task`
  String get update_task {
    return Intl.message('Update Task', name: 'update_task', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `App Language`
  String get app_language {
    return Intl.message(
      'App Language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get choose_language {
    return Intl.message(
      'Choose Language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get system_default {
    return Intl.message(
      'System Default',
      name: 'system_default',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Arabic`
  String get arabic {
    return Intl.message('Arabic', name: 'arabic', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Due Date`
  String get Due_date {
    return Intl.message('Due Date', name: 'Due_date', desc: '', args: []);
  }

  /// `Deadline`
  String get deadline {
    return Intl.message('Deadline', name: 'deadline', desc: '', args: []);
  }

  /// `Select Time`
  String get select_time {
    return Intl.message('Select Time', name: 'select_time', desc: '', args: []);
  }

  /// `Select Date`
  String get select_date {
    return Intl.message('Select Date', name: 'select_date', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
