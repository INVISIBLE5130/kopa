import 'package:get_it/get_it.dart';
import 'core/CRUDModel.dart';
import 'core/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}