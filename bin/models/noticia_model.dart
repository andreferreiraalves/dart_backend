class NoticiaModel {
  final int? id;
  final String titulo;
  final String descricao;
  final String imagem;
  final DateTime dataPublicacao;
  final DateTime? dataAtualizacao;

  NoticiaModel(
    this.id,
    this.titulo,
    this.descricao,
    this.imagem,
    this.dataPublicacao,
    this.dataAtualizacao,
  );

  factory NoticiaModel.fromJson(Map map) {
    return NoticiaModel(
      map['id'],
      map['titulo'],
      map['descricao'],
      map['imagem'],
      // DateTime.fromMicrosecondsSinceEpoch(map['dataPublicacao']),
      DateTime.parse(map['dataPublicacao']),
      map['dataAtualizacao'] != null ? DateTime.fromMicrosecondsSinceEpoch(map['dataAtualizacao']) : null,
    );
  }
}
