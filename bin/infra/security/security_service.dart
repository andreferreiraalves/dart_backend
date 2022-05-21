import 'package:shelf/shelf.dart';

abstract class SecurityService<T> {
  Future<String> generateJWT(String userID);
  Future<T?> validadeJWT(String toke);

  Middleware get verifyJwt;
  Middleware get authorization;
}
