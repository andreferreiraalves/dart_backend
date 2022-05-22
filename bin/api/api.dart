import 'package:shelf/shelf.dart';

abstract class Api {
  Handler getHandler({List<Middleware>? middleware});

  Handler createHandler({
    required Handler router,
    List<Middleware>? middleware,
  }) {
    middleware ??= [];

    var pipe = Pipeline();

    middleware.forEach((m) => pipe = pipe.addMiddleware(m));

    return pipe.addHandler(router);
  }
}
