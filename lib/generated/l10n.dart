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

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Chào bạn đến với CitiZen!`
  String get welcome {
    return Intl.message(
      'Chào bạn đến với CitiZen!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Cùng nhau xây dựng một thế giới tốt đẹp hơn`
  String get subWelcome {
    return Intl.message(
      'Cùng nhau xây dựng một thế giới tốt đẹp hơn',
      name: 'subWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc`
  String get or {
    return Intl.message(
      'Hoặc',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login {
    return Intl.message(
      'Đăng nhập',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu`
  String get password {
    return Intl.message(
      'Mật khẩu',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get forgotPassword {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa có tài khoản?`
  String get dontHaveAccount {
    return Intl.message(
      'Bạn chưa có tài khoản?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get register {
    return Intl.message(
      'Đăng ký',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email`
  String get emailRequired {
    return Intl.message(
      'Vui lòng nhập email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email không hợp lệ`
  String get invalidEmail {
    return Intl.message(
      'Email không hợp lệ',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Xác thưc Email`
  String get verifyEmail {
    return Intl.message(
      'Xác thưc Email',
      name: 'verifyEmail',
      desc: '',
      args: [],
    );
  }

  /// `Số CMND/CCCD/Hộ chiếu`
  String get nationalId {
    return Intl.message(
      'Số CMND/CCCD/Hộ chiếu',
      name: 'nationalId',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get confirmPassword {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập ít nhất 6 ksý tự`
  String get invalidPassword {
    return Intl.message(
      'Vui lòng nhập ít nhất 6 ksý tự',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email đã được gửi đến `
  String get verificationEmailMessage1 {
    return Intl.message(
      'Email đã được gửi đến ',
      name: 'verificationEmailMessage1',
      desc: '',
      args: [],
    );
  }

  /// `. Vui lòng kiểm tra và xác thực email để tiếp tục đăng ký tài khoản.`
  String get verificationEmailMessage2 {
    return Intl.message(
      '. Vui lòng kiểm tra và xác thực email để tiếp tục đăng ký tài khoản.',
      name: 'verificationEmailMessage2',
      desc: '',
      args: [],
    );
  }

  /// `Xác thực`
  String get verify {
    return Intl.message(
      'Xác thực',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Hóa đơn`
  String get recept {
    return Intl.message(
      'Hóa đơn',
      name: 'recept',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo`
  String get notification {
    return Intl.message(
      'Thông báo',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản`
  String get profile {
    return Intl.message(
      'Tài khoản',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Email hoặc mật khẩu không đúng`
  String get invalidCredentials {
    return Intl.message(
      'Email hoặc mật khẩu không đúng',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Có lỗi xảy ra. Vui lòng thử lại sau`
  String get somethingWentWrong {
    return Intl.message(
      'Có lỗi xảy ra. Vui lòng thử lại sau',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Bạn đã có tài khoản?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Bạn đã có tài khoản?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập số CMND/CCCD/Hộ chiếu`
  String get nationalIdRequired {
    return Intl.message(
      'Vui lòng nhập số CMND/CCCD/Hộ chiếu',
      name: 'nationalIdRequired',
      desc: '',
      args: [],
    );
  }

  /// `Số CMND/CCCD/Hộ chiếu không hợp lệ`
  String get invalidNationalId {
    return Intl.message(
      'Số CMND/CCCD/Hộ chiếu không hợp lệ',
      name: 'invalidNationalId',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu xác nhận không khớp`
  String get invalidConfirmPassword {
    return Intl.message(
      'Mật khẩu xác nhận không khớp',
      name: 'invalidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email đã tồn tại`
  String get emailAlreadyExists {
    return Intl.message(
      'Email đã tồn tại',
      name: 'emailAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Số CMND/CCCD/Hộ chiếu đã được đăng kí`
  String get nationalIdAlreadyExists {
    return Intl.message(
      'Số CMND/CCCD/Hộ chiếu đã được đăng kí',
      name: 'nationalIdAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Không tìm thấy số CMND/CCCD/Hộ chiếu trong dữ liệu`
  String get nationalIdNotFound {
    return Intl.message(
      'Không tìm thấy số CMND/CCCD/Hộ chiếu trong dữ liệu',
      name: 'nationalIdNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại mã sau`
  String get resendCodeIn {
    return Intl.message(
      'Gửi lại mã sau',
      name: 'resendCodeIn',
      desc: '',
      args: [],
    );
  }

  /// `Gửi lại`
  String get resend {
    return Intl.message(
      'Gửi lại',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Mã xác thực không hợp lệ`
  String get invalidCode {
    return Intl.message(
      'Mã xác thực không hợp lệ',
      name: 'invalidCode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
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
