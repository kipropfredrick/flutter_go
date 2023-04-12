import 'package:finance/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;
abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}

const platformMobile = Environment('platformMobile');
const platformWeb = Environment('platformWeb');

@InjectableInit()
Future<void> configureDependencies({String? env}) async =>
    await locator.init(environment: env);