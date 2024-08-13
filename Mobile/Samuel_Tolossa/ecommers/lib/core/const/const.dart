

class Urls {

  static String getByUrl(String id) =>  'https://fakestoreapi.com/products/$id';
  static String getAll() =>  'https://g5-flutter-learning-path-be.onrender.com/api/v1/products';
  static String addNewProduct() => 'https://fakestoreapi.com/products';
  static String updateProduct(String id) => 'https://fakestoreapi.com/products/$id';
  static String deleteProduct(String id) => 'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id';
}