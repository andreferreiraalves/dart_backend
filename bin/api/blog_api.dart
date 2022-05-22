import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../models/noticia_model.dart';
import '../services/generic_service.dart';
import 'api.dart';

class BlogApi extends Api {
  final GenericService<NoticiaModel> _service;

  BlogApi(this._service);

  @override
  Handler getHandler({List<Middleware>? middleware}) {
    Router router = Router();

    router.get('/blog/noticias', (Request req) {
      List<NoticiaModel> noticias = _service.findAll();

      return Response.ok(jsonEncode(noticias));
    });

    router.post('/blog/noticias', (Request req) async {
      var body = await req.readAsString();
      _service.save(NoticiaModel.fromJson(jsonDecode(body)));
      return Response(201);
    });

    router.put('/blog/noticias', (Request req) {
      String? id = req.url.queryParameters['id'];

      return Response.ok('atualização de noticias');
    });

    router.delete('/blog/noticias', (Request req) {
      return Response.ok('exclusão de notícias');
    });

    return createHandler(router: router, middleware: middleware);
  }
}
