class EndPoints {
  static String baseUrl = "https://dummyjson.com/";
  static String signin = "auth/login";
  static String me = "auth/me";
  static String refreshToken = "auth/refresh";
  static String products = "products/";
  static String search = "search?q=";
  static String categories = "categories/";
  static String category = "category/";
  static String users = "users/";
  static String cart = "cart/";
  static String carts = "carts/";
  static String user = "user/";
  static String addUser = "${EndPoints.users}add";
  static String addPro = "${EndPoints.products}add";
  static String addCart = "${EndPoints.cart}add";
  static String updateCart = "${EndPoints.carts}/";
  static String deleteCart = "${EndPoints.carts}/";

  static String getUserEndPoint(int id) {
    return "${EndPoints.baseUrl}users/$id";
  }

  static String getProByCategEndPoint(String name) {
    return "${EndPoints.baseUrl}${EndPoints.products}${EndPoints.category}$name";
  }
}

class ApiKey {
  static String token = "token";
  static String refreshToken = "refresh_token";
  static String statusCode = "status";
  static String errorMessage = "ErrorMessage";
  static String id = "id";
  static String email = "email";
  static String password = "password";
  static String name = "name";
  static String image = "image";
  static String username = "username";
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String gender = "gender";
}
