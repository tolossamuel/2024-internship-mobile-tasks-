

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/check_connectivity.dart';
import 'features/ecommerce/Data/data_source/local_data_source.dart';
import 'features/ecommerce/Data/data_source/remote_data_source.dart';
import 'features/ecommerce/Data/repositories/ecommerce_repo_impl.dart';
import 'features/ecommerce/Domain/repositories/ecommerce_repositories.dart';
import 'features/ecommerce/Domain/usecase/ecommerce_usecase.dart';
import 'features/ecommerce/presentation/state/input_button_activation/button_bloc.dart';
import 'features/ecommerce/presentation/state/image_input_display/image_bloc.dart';
import 'features/ecommerce/presentation/state/product_bloc/product_bloc.dart';

final locator = GetIt.instance;


Future<void> SetUpLocator() async {
 
  final sharedPreferences = await SharedPreferences.getInstance();

  final InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  locator.registerLazySingleton<http.Client>(() => http.Client());
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => connectionChecker);
  // 

  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: locator()));
  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: locator()));
  locator.registerLazySingleton<EcommerceRemoteDataSource>(() => EcommerceRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<EcommerceRepositories>(() => EcommerceRepoImpl(remoteDataSource: locator(), networkInfo: locator()));

  locator.registerLazySingleton(() => EcommerceUsecase(repositories: locator()));
  locator.registerFactory(
    () => ProductBloc(ecommerceUsecase: locator()),
  );

  locator.registerFactory(
    () => ImageBloc(ecommerceUsecase: locator()),
  );
  locator.registerFactory(
    () => ButtonBloc(ecommerceUsecase: locator()),
  );

  
}

