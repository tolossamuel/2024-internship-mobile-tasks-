

class Urls {

  static String getByUrl(int id) =>  'https://fakestoreapi.com/products/$id';
  static String getAll() =>  'https://fakestoreapi.com/products';
  static String addNewProduct() => 'https://fakestoreapi.com/products';
  static String updateProduct(int id) => 'https://fakestoreapi.com/products/$id';
  static String deleteProduct(int id) => 'https://fakestoreapi.com/products/$id';
}