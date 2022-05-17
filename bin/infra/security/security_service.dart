abstract class SecurityService<T> {
  Future<String> generateJWT(String userID);
  T? validadeJWT(String toke);
}
