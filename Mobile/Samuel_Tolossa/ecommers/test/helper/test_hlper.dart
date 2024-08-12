


import 'package:ecommers/core/network/check_connectivity.dart';
import 'package:ecommers/features/ecommerce/Data/data_source/local_data_source.dart';
import 'package:ecommers/features/ecommerce/Data/data_source/remote_data_source.dart';
import 'package:ecommers/features/ecommerce/Domain/repositories/ecommerce_repositories.dart';
import 'package:ecommers/features/ecommerce/Domain/usecase/ecommerce_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks(

  [
    EcommerceRepositories,
    EcommerceRemoteDataSourceImpl,
    NetworkInfoImpl,
    InternetConnectionChecker,
    SharedPreferences,
    LocalDataSourceImpl,
    EcommerceUsecase,
  
  ],
  customMocks :[MockSpec<http.Client>(as : #MockHttpClient)],

)
@GenerateMocks([http.Client])
void main() {}

