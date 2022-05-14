import 'package:collection/collection.dart';
import '../models/noticia_model.dart';
import 'generic_service.dart';

class NoticiaService implements GenericService<NoticiaModel> {
  List<NoticiaModel> _fakeDB = [];

  @override
  bool delete(int id) {
    _fakeDB.removeWhere((element) => element.id == id);
    return true;
  }

  @override
  List<NoticiaModel> findAll() {
    return _fakeDB;
  }

  @override
  NoticiaModel findOne(int id) {
    return _fakeDB.firstWhere((element) => element.id == id);
  }

  @override
  bool save(NoticiaModel value) {
    var model = _fakeDB.firstWhereOrNull((e) => e.id == value.id);

    if (model == null) {
      _fakeDB.add(value);
    } else {
      var index = _fakeDB.indexOf(model);
      _fakeDB[index] = model;
    }

    return true;
  }
}
