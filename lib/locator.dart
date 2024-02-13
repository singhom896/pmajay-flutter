import 'package:get_it/get_it.dart';


import 'network/viewmodel/MyProfileVM.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // locator.registerLazySingleton(() => MainPageModel());
  // locator.registerSingleton(Services());

  locator.registerFactory(() => MyProfileVM());


}