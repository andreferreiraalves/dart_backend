import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandle {
  Handler get handler {
    final router = Router();

    // router.get('/', (Request request) => Response(200, body: 'primeira rota'));
    router.get('/', (Request request) => Response.ok('<h1>primeira rota</h1>', headers: {'content-type': 'text/html'}));

    router.get('/dados/<usuario>', (Request request, String usuario) => Response.ok('nome do usuário $usuario'));

    // usando query parameter
    router.get('/query', (Request request) {
      String? nome = request.url.queryParameters['nome'];

      return Response.ok('Info query: $nome');
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      final usuario = json['usuario'];
      final senha = json['senha'];

      if ((usuario == 'admin') && (senha == '123')) {
        return Response.ok(
            jsonEncode({
              'token': 'çalksdjfçalskdfj',
              'userId': 1,
            }),
            headers: {'content-type': 'application/json'});
      } else {
        return Response.forbidden('Acesso negado');
      }
    });

    return router;
  }
}
