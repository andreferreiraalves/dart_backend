import 'package:shelf/shelf.dart';

import '../../utils/custom_env.dart';
import 'security_service.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class SecurityServiceImp implements SecurityService<JWT> {
  @override
  Future<String> generateJWT(String userID) async {
    var jwt = JWT({
      'iat': DateTime.now().microsecondsSinceEpoch,
      'userID': userID,
      'roles': ['user', 'sales'],
    });

    String key = await CustomEnv.get(key: 'jwt_key');
    return jwt.sign(SecretKey(key));
  }

  @override
  Future<JWT?> validadeJWT(String token) async {
    String key = await CustomEnv.get(key: 'jwt_key');

    try {
      return JWT.verify(token, SecretKey(key));
    } on JWTInvalidError {
      return null;
    } on JWTExpiredError {
      return null;
    } on JWTNotActiveError {
      return null;
    } on JWTUndefinedError {
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Middleware get authorization {
    return (Handler handler) {
      return (Request req) async {
        String? authorizationHeader = req.headers['Authorization'];
        JWT? jwt;

        if ((authorizationHeader != null) && (authorizationHeader.startsWith('Bearer '))) {
          String token = authorizationHeader.substring(7);
          jwt = await validadeJWT(token);
        }

        var request = req.change(context: {'jwt': jwt});
        return handler(request);
      };
    };
  }

  @override
  Middleware get verifyJwt {
    return createMiddleware(
      requestHandler: (Request req) {
        if (req.context['jwt'] == null) {
          return Response.forbidden('Not Authorized');
        }
        return null;
      },
    );
  }
}
