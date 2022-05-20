abstract class SecurityService<T> {
  Future<String> generateJWT(String userID);
  Future<T?> validadeJWT(String toke);
}
