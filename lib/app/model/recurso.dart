
class Recurso {
  String publico;
  String titulo;
  String descricao;
  String duracao;
  String autoria;
  String categoria;
  String link;
  String tipo;
  
  Recurso({
    this.publico,
    this.titulo,
    this.descricao,
    this.duracao,
    this.autoria,
    this.categoria,
    this.link,
    this.tipo,
  });
  

  

 

  factory Recurso.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Recurso(
      publico: map['publico'],
      titulo: map['titulo'],
      descricao: map['descricao'],
      duracao: (map['duracao']),
      autoria: map['autoria'],
      categoria: map['categoria'],
      link: map['link'],
      tipo: map['tipo'],
    );
  }

  
  @override
  String toString() {
    return 'Recurso(publico: $publico, titulo: $titulo, descricao: $descricao, duracao: $duracao, autoria: $autoria, categoria: $categoria, link: $link, tipo: $tipo)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Recurso &&
      o.publico == publico &&
      o.titulo == titulo &&
      o.descricao == descricao &&
      o.duracao == duracao &&
      o.autoria == autoria &&
      o.categoria == categoria &&
      o.link == link &&
      o.tipo == tipo;
  }

  @override
  int get hashCode {
    return publico.hashCode ^
      titulo.hashCode ^
      descricao.hashCode ^
      duracao.hashCode ^
      autoria.hashCode ^
      categoria.hashCode ^
      link.hashCode ^
      tipo.hashCode;
  }
}
