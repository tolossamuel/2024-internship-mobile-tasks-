


import 'package:ecommers/features/ecommerce/Domain/repositories/ecommerce_repositories.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(

  [
    EcommerceRepositories
  ],
  customMocks :[MockSpec<http.Client>(as : #MockHttpClient)],

)

void main() {}