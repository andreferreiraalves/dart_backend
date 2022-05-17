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
  JWT? validadeJWT(String toke) {
    // TODO: implement validadeJWT
    throw UnimplementedError();
  }
}
