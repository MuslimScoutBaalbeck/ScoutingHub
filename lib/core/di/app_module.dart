import 'package:injectable/injectable.dart';
import 'package:scouting_hub/core/database/database.dart';
import 'package:scouting_hub/core/router/app_router.dart';

const kProdBaseUrl = 'PROD';
const kStgBaseUrl = 'STG';
const kDevBaseUrl = 'DEV';

@module
abstract class AppModule {
  /// Database
  @singleton
  AppDatabase get myDb => AppDatabase();

  /// Router
  @singleton
  AppRouter get appRouter => AppRouter();
}
