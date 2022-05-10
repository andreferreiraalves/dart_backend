import 'dart:ffi';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerHandle {
  Handler get handler {
    final router = Router();

    // router.get('/', (Request request) => Response(200, body: 'primeira rota'));
    router.get('/', (Request request) => Response.ok('primeira rota'));

    router.get('/dados/<usuario>', (Request request, String usuario) => Response.ok('nome do usuário $usuario'));

    // usando query parameter
    router.get('/query', (Request request) {
      String? nome = request.url.queryParameters['nome'];

      return Response.ok('Info query: $nome');
    });

    return router;
  }
}
