

import 'package:ecommers/core/Error/error.dart';
import 'package:ecommers/core/const/const.dart';
import 'package:ecommers/features/ecommerce/Data/data_source/remote_data_source.dart';
import 'package:ecommers/features/ecommerce/Data/model/ecommerce_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../helper/dummy_data/read_json.dart';
import '../../helper/test_hlper.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockHttpClient mockHttpClient;

  late EcommerceRemoteDataSourceImpl ecommerceRemoteDataSourceImpl;


  setUpAll(() {
    mockHttpClient = MockHttpClient();
    ecommerceRemoteDataSourceImpl = EcommerceRemoteDataSourceImpl(client: mockHttpClient);
  });
  const EcommerceModel model = EcommerceModel (
    id: 1,
    name: 'name',
    price: 1,
    description: 'description',
    imageUrl: 'imageUrl',
  );
  
  int id = 1;
  group(
    'remote data source must return the model',
    () {
     test(
        'it must return the data by id',
        () async{
          when(
            mockHttpClient.get(Uri.parse(Urls.getByUrl(id)))
          ).thenAnswer(
            (_) async => http.Response (
              readJson('helper/dummy_data/json_respond_data.json'),200
            )
          );

          final result = await ecommerceRemoteDataSourceImpl.getProduct(id);

          expect(result, isA<EcommerceModel>());
        });  

        test(
        'it must return server error',
        () async{
          when(
            mockHttpClient.get(Uri.parse(Urls.getByUrl(id)))
          ).thenAnswer(
            (_) async => http.Response (
              'server errro',404,
            )
          );

          final result = ecommerceRemoteDataSourceImpl.getProduct(id);

          expect(result, throwsA(isA<ConnectionFailur>()));
        });  


      test(
        'it must return the all the data of the product',
        () async{
          when(
            mockHttpClient.get(Uri.parse(Urls.getAll()))
          ).thenAnswer(
            (_) async => http.Response (
              readJson('helper/dummy_data/all_data.json'),200
            )
          );

          final result = await ecommerceRemoteDataSourceImpl.getAllProduct();

          expect(result, isA<List<EcommerceModel>>());
        });   


        test(
        'it must return true if the data is deleted else false from remote data source',
        () async{
          when(
            mockHttpClient.delete(Uri.parse(Urls.deleteProduct(id)))
          ).thenAnswer(
            (_) async => http.Response (
              'true',200
            )
          );

          final result = await ecommerceRemoteDataSourceImpl.deleteProduct(id);

          expect(result, true);
        });

        test(
        'it must return true if the data is updated from remote data source else false',
        () async{
          when(
            mockHttpClient.put(
              Uri.parse(Urls.updateProduct(id)),
              body: model.toJson()
              )
          ).thenAnswer(
            (_) async => http.Response (
              'true',200
            )
          );

          final result = await ecommerceRemoteDataSourceImpl.editProduct(id, model);

          expect(result, true);
        });

        test(
        'it must return true if the data is add to remote data source else false',
        () async{
          when(
            mockHttpClient.post(
              Uri.parse(Urls.addNewProduct()),
              body: model.toJson()
              )
          ).thenAnswer(
            (_) async => http.Response (
              'true',200
            )
          );

          final result = await ecommerceRemoteDataSourceImpl.addProduct(model);

          expect(result, true);
        });
    }
    
    
    );
}