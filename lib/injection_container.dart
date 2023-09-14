import 'package:get_it/get_it.dart';
// import 'package:qommsion/authentication/data/location_inj.dart';
// import 'package:qommsion/home/data/home_inj.dart';
// ignore: depend_on_referenced_packages
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/data/auth_inj.dart';
import 'constants/app_data/repo.dart';
import 'constants/kvalues.dart';
import 'helper/api.dart';

final sl = GetIt.instance;
final ApiBaseHelper helper = ApiBaseHelper();
Future<void> init() async {
  // core
  initAuthInjection(sl);
  // initLocationInjection(sl);
  // initHomeInjection(sl);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(
      () => AppRepository(KeyValueStorage(sharedPreferences)));
  helper.dioInit();
  sl.registerLazySingleton(() => helper);
}
