

class Urls {

  static String getByUrl(String id) =>  'https://fakestoreapi.com/products/$id';
  static String getAll() =>  'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String addNewProduct() => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String updateProduct(String id) => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
  static String deleteProduct(String id) => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
}



class LoginApi {

  static const String registerApi = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register';
  static const String loginApi = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login';

  static const String findMe  = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me';
}