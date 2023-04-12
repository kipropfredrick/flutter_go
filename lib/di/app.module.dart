import 'package:finance/di/services/firebase.service.dart';
import 'package:finance/di/services/notification.service.dart';
import 'package:finance/repo_source/local/local_resource.dart';
import 'package:finance/routes/routes.gr.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  // @preResolve
  // Future<FirebaseService> get fireService => FirebaseService.init();

  // @injectable
  // FirebaseFirestore get store => FirebaseFirestore.instance;

  @injectable
  LocalStorageManager get localstorage => LocalStorageManager();

  @injectable
  AppRouter get appRouter => AppRouter();

  // @preResolve
  // Future<NotificationService> get notificationService async => await NotificationService.init();
}