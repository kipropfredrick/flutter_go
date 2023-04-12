// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:finance/screens/add_screen.dart' as _i2;
import 'package:finance/screens/authentication/forget_passowrd.dart' as _i7;
import 'package:finance/screens/authentication/resset_password.dart' as _i5;
import 'package:finance/screens/authentication/sign_up_page.dart' as _i6;
import 'package:finance/screens/home_page.dart' as _i3;
import 'package:finance/screens/statistics_page.dart' as _i4;
import 'package:finance/widgets/bottom_navigation.dart' as _i1;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    BottomNav.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNav(),
      );
    },
    Add_screen.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.Add_screen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    Statistics.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.Statistics(),
      );
    },
    RessetOtp.name: (routeData) {
      final args = routeData.argsAs<RessetOtpArgs>();
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.RessetOtp(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    LoginSignupScreen.name: (routeData) {
      final args = routeData.argsAs<LoginSignupScreenArgs>();
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginSignupScreen(
          key: args.key,
          phone: args.phone,
        ),
      );
    },
    ResetPassword.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.ResetPassword(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          BottomNav.name,
          path: '/bottom-nav',
        ),
        _i8.RouteConfig(
          Add_screen.name,
          path: '/add_money',
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/home-page',
        ),
        _i8.RouteConfig(
          Statistics.name,
          path: '/Statistics',
        ),
        _i8.RouteConfig(
          RessetOtp.name,
          path: '/resset-otp',
        ),
        _i8.RouteConfig(
          LoginSignupScreen.name,
          path: '/login-signup-screen',
        ),
        _i8.RouteConfig(
          ResetPassword.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.BottomNav]
class BottomNav extends _i8.PageRouteInfo<void> {
  const BottomNav()
      : super(
          BottomNav.name,
          path: '/bottom-nav',
        );

  static const String name = 'BottomNav';
}

/// generated route for
/// [_i2.Add_screen]
class Add_screen extends _i8.PageRouteInfo<void> {
  const Add_screen()
      : super(
          Add_screen.name,
          path: '/add_money',
        );

  static const String name = 'Add_screen';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home-page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.Statistics]
class Statistics extends _i8.PageRouteInfo<void> {
  const Statistics()
      : super(
          Statistics.name,
          path: '/Statistics',
        );

  static const String name = 'Statistics';
}

/// generated route for
/// [_i5.RessetOtp]
class RessetOtp extends _i8.PageRouteInfo<RessetOtpArgs> {
  RessetOtp({
    _i9.Key? key,
    required String phone,
  }) : super(
          RessetOtp.name,
          path: '/resset-otp',
          args: RessetOtpArgs(
            key: key,
            phone: phone,
          ),
        );

  static const String name = 'RessetOtp';
}

class RessetOtpArgs {
  const RessetOtpArgs({
    this.key,
    required this.phone,
  });

  final _i9.Key? key;

  final String phone;

  @override
  String toString() {
    return 'RessetOtpArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i6.LoginSignupScreen]
class LoginSignupScreen extends _i8.PageRouteInfo<LoginSignupScreenArgs> {
  LoginSignupScreen({
    _i9.Key? key,
    required String phone,
  }) : super(
          LoginSignupScreen.name,
          path: '/login-signup-screen',
          args: LoginSignupScreenArgs(
            key: key,
            phone: phone,
          ),
        );

  static const String name = 'LoginSignupScreen';
}

class LoginSignupScreenArgs {
  const LoginSignupScreenArgs({
    this.key,
    required this.phone,
  });

  final _i9.Key? key;

  final String phone;

  @override
  String toString() {
    return 'LoginSignupScreenArgs{key: $key, phone: $phone}';
  }
}

/// generated route for
/// [_i7.ResetPassword]
class ResetPassword extends _i8.PageRouteInfo<void> {
  const ResetPassword()
      : super(
          ResetPassword.name,
          path: '/',
        );

  static const String name = 'ResetPassword';
}
