import 'package:get_it/get_it.dart';
import 'package:bunkie/services/services.dart';

GetIt locator = GetIt.instance;

///Registers dependencies
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirestoreService());
}
