import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

import 'server_handle.dart';

void main() async {
  final _server = ServerHandle();

  final server = await shelf_io.serve(
    _server.handler,
    'localhost',
    3000,
  );

  print('Server running http://localhost:3000');
}
