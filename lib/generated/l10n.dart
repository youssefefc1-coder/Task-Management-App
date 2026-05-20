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

  /// `Simplify your productivity`
  String get login_phase {
    return Intl.message(
      'Simplify your productivity',
      name: 'login_phase',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
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

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirme_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirme_password',
      desc: '',
      args: [],
    );
  }

  /// `Password and Confirm Password doesn't match`
  String get passwords_dont_match {
    return Intl.message(
      'Password and Confirm Password doesn\'t match',
      name: 'passwords_dont_match',
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

  /// `OR CONTINUE WITH`
  String get or_continue_with {
    return Intl.message(
      'OR CONTINUE WITH',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message('Google', name: 'google', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message('Sign Up', name: 'signup', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get enter_your_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Send Reset Link`
  String get send_reset_link {
    return Intl.message(
      'Send Reset Link',
      name: 'send_reset_link',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message('Log In', name: 'login', desc: '', args: []);
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Join Tasky and stay organized effortlessly.`
  String get signup_phase {
    return Intl.message(
      'Join Tasky and stay organized effortlessly.',
      name: 'signup_phase',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get your_name {
    return Intl.message('Your Name', name: 'your_name', desc: '', args: []);
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

  /// `Good Morning`
  String get good_morning {
    return Intl.message(
      'Good Morning',
      name: 'good_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get good_afternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'good_afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get good_evening {
    return Intl.message(
      'Good Evening',
      name: 'good_evening',
      desc: '',
      args: [],
    );
  }

  /// `Good Night`
  String get good_night {
    return Intl.message('Good Night', name: 'good_night', desc: '', args: []);
  }

  /// `Hello,`
  String get hello {
    return Intl.message('Hello,', name: 'hello', desc: '', args: []);
  }

  /// `No Tasks Yet`
  String get no_tasks {
    return Intl.message('No Tasks Yet', name: 'no_tasks', desc: '', args: []);
  }

  /// `DONE`
  String get done {
    return Intl.message('DONE', name: 'done', desc: '', args: []);
  }

  /// `PENDING`
  String get pending {
    return Intl.message('PENDING', name: 'pending', desc: '', args: []);
  }

  /// `TOTAL`
  String get total {
    return Intl.message('TOTAL', name: 'total', desc: '', args: []);
  }

  /// `Your Tasks`
  String get your_tasks {
    return Intl.message('Your Tasks', name: 'your_tasks', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Work`
  String get work {
    return Intl.message('Work', name: 'work', desc: '', args: []);
  }

  /// `Personal`
  String get personal {
    return Intl.message('Personal', name: 'personal', desc: '', args: []);
  }

  /// `Urgent`
  String get urgent {
    return Intl.message('Urgent', name: 'urgent', desc: '', args: []);
  }

  /// `Health`
  String get health {
    return Intl.message('Health', name: 'health', desc: '', args: []);
  }

  /// `Sport`
  String get sport {
    return Intl.message('Sport', name: 'sport', desc: '', args: []);
  }

  /// `Study`
  String get study {
    return Intl.message('Study', name: 'study', desc: '', args: []);
  }

  /// `Shopping`
  String get shopping {
    return Intl.message('Shopping', name: 'shopping', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `High`
  String get high {
    return Intl.message('High', name: 'high', desc: '', args: []);
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Low`
  String get low {
    return Intl.message('Low', name: 'low', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
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

  /// `Completed Tasks`
  String get completed_tasks {
    return Intl.message(
      'Completed Tasks',
      name: 'completed_tasks',
      desc: '',
      args: [],
    );
  }

  /// `No Completed Tasks`
  String get no_completed_tasks {
    return Intl.message(
      'No Completed Tasks',
      name: 'no_completed_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Uncompleted Tasks`
  String get uncompleted_tasks {
    return Intl.message(
      'Uncompleted Tasks',
      name: 'uncompleted_tasks',
      desc: '',
      args: [],
    );
  }

  /// `No Uncompleted Tasks`
  String get no_uncompleted_tasks {
    return Intl.message(
      'No Uncompleted Tasks',
      name: 'no_uncompleted_tasks',
      desc: '',
      args: [],
    );
  }

  /// `No Deadline`
  String get no_deadline {
    return Intl.message('No Deadline', name: 'no_deadline', desc: '', args: []);
  }

  /// `No Description`
  String get no_description {
    return Intl.message(
      'No Description',
      name: 'no_description',
      desc: '',
      args: [],
    );
  }

  /// `TASK NAME`
  String get task_name {
    return Intl.message('TASK NAME', name: 'task_name', desc: '', args: []);
  }

  /// `DESCRIPTION`
  String get description {
    return Intl.message('DESCRIPTION', name: 'description', desc: '', args: []);
  }

  /// `Task Name can't be Empty`
  String get task_name_empty_er {
    return Intl.message(
      'Task Name can\'t be Empty',
      name: 'task_name_empty_er',
      desc: '',
      args: [],
    );
  }

  /// `New Task`
  String get new_task {
    return Intl.message('New Task', name: 'new_task', desc: '', args: []);
  }

  /// `Edit Task`
  String get edit_task {
    return Intl.message('Edit Task', name: 'edit_task', desc: '', args: []);
  }

  /// `What need to be done?`
  String get task_name_field_hint_text {
    return Intl.message(
      'What need to be done?',
      name: 'task_name_field_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Add more details about the task...`
  String get description_field_hint_text {
    return Intl.message(
      'Add more details about the task...',
      name: 'description_field_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `DUE DATE`
  String get due_date {
    return Intl.message('DUE DATE', name: 'due_date', desc: '', args: []);
  }

  /// `TIME`
  String get time {
    return Intl.message('TIME', name: 'time', desc: '', args: []);
  }

  /// `select Time`
  String get select_time {
    return Intl.message('select Time', name: 'select_time', desc: '', args: []);
  }

  /// `select Date`
  String get select_date {
    return Intl.message('select Date', name: 'select_date', desc: '', args: []);
  }

  /// `PRIORITY LEVEL`
  String get priority_level {
    return Intl.message(
      'PRIORITY LEVEL',
      name: 'priority_level',
      desc: '',
      args: [],
    );
  }

  /// `CATEGORY`
  String get category {
    return Intl.message('CATEGORY', name: 'category', desc: '', args: []);
  }

  /// `Create Task`
  String get create_task {
    return Intl.message('Create Task', name: 'create_task', desc: '', args: []);
  }

  /// `Update Task`
  String get update_task {
    return Intl.message('Update Task', name: 'update_task', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Edit Name`
  String get edit_name {
    return Intl.message('Edit Name', name: 'edit_name', desc: '', args: []);
  }

  /// `Update Name`
  String get update_name {
    return Intl.message('Update Name', name: 'update_name', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
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

  /// `System (Default)`
  String get system_default {
    return Intl.message(
      'System (Default)',
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

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Choose Theme Mode`
  String get choose_theme_mode {
    return Intl.message(
      'Choose Theme Mode',
      name: 'choose_theme_mode',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode {
    return Intl.message('Dark Mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Light Mode`
  String get light_mode {
    return Intl.message('Light Mode', name: 'light_mode', desc: '', args: []);
  }

  /// `System`
  String get system {
    return Intl.message('System', name: 'system', desc: '', args: []);
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out? You will need to sign back in to access your data.`
  String get logout_message {
    return Intl.message(
      'Are you sure you want to log out? You will need to sign back in to access your data.',
      name: 'logout_message',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters.`
  String get weak_password {
    return Intl.message(
      'Password must be at least 6 characters.',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use.`
  String get email_already_in_use {
    return Intl.message(
      'This email is already in use.',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email.`
  String get invalid_email {
    return Intl.message(
      'Please enter a valid email.',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email.`
  String get user_not_found {
    return Intl.message(
      'No account found with this email.',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password, please try again.`
  String get wrong_password {
    return Intl.message(
      'Incorrect password, please try again.',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password.`
  String get invalid_credential {
    return Intl.message(
      'Incorrect email or password.',
      name: 'invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled.`
  String get user_disabled {
    return Intl.message(
      'This account has been disabled.',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts, please try again later.`
  String get too_many_requests {
    return Intl.message(
      'Too many attempts, please try again later.',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `This sign in method is not enabled.`
  String get operation_not_allowed {
    return Intl.message(
      'This sign in method is not enabled.',
      name: 'operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection, please check your network.`
  String get network_request_failed {
    return Intl.message(
      'No internet connection, please check your network.',
      name: 'network_request_failed',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again.`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Please Verify your email before logging in.`
  String get verify_alert_message {
    return Intl.message(
      'Please Verify your email before logging in.',
      name: 'verify_alert_message',
      desc: '',
      args: [],
    );
  }

  /// `Sign in cancelled`
  String get sign_in_cancel {
    return Intl.message(
      'Sign in cancelled',
      name: 'sign_in_cancel',
      desc: '',
      args: [],
    );
  }

  /// `User does not exist`
  String get user_dont_exist {
    return Intl.message(
      'User does not exist',
      name: 'user_dont_exist',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email for password reset instructions.`
  String get reset_link_sent {
    return Intl.message(
      'Please check your email for password reset instructions.',
      name: 'reset_link_sent',
      desc: '',
      args: [],
    );
  }

  /// `⏰ Deadline in 1 hour`
  String get task_notification_title {
    return Intl.message(
      '⏰ Deadline in 1 hour',
      name: 'task_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `is due soon!`
  String get task_notification_body {
    return Intl.message(
      'is due soon!',
      name: 'task_notification_body',
      desc: '',
      args: [],
    );
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
