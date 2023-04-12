import 'package:finance/bloc/user_cubit.dart';
import 'package:finance/di/injection.dart';
import 'package:finance/routes/routes.gr.dart';
import 'package:finance/screens/home_page.dart';
import 'package:finance/screens/statistics_page.dart';
import 'package:finance/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureDependencies(env: Env.dev);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    late final _appRouter = AppRouter();
    final authc=locator<AuthCubit>();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<AuthCubit>(
            lazy: false,
            create: (context) => authc,
          ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        routeInformationProvider: _appRouter.routeInfoProvider(),
      ),
    );
  }
}

