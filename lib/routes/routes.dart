import 'package:auto_route/annotations.dart';
import 'package:finance/screens/add_screen.dart';
import 'package:finance/screens/authentication/forget_passowrd.dart';
import 'package:finance/screens/authentication/resset_password.dart';
import 'package:finance/screens/authentication/sign_up_page.dart';
import 'package:finance/screens/home_page.dart';
import 'package:finance/screens/statistics_page.dart';
import 'package:finance/widgets/bottom_navigation.dart';

@AdaptiveAutoRouter(
    replaceInRouteName: 'Page,Route',
    routes: <AutoRoute>[
      AutoRoute(page: BottomNav),
      AutoRoute(page: Add_screen,path: '/add_money'),
      AutoRoute(page: HomePage),
      AutoRoute(page: Statistics),
      AutoRoute(page: RessetOtp),
      AutoRoute(page: LoginSignupScreen),
      AutoRoute(page: ResetPassword,initial: true),


    ],
)
class $AppRouter {}