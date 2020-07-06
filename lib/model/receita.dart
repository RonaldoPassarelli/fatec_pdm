class Receita {
  //Atributos
  String _id;
  String _nome;
  String _descricao;
  String _codreceita;

  //Construtor
  Receita(this._id, this._nome, this._descricao, this._codreceita);

  //Getters
  String get id => _id;
  String get nome => _nome;
  String get descricao => _descricao;
  String get codreceita => _codreceita;
  Receita.map(dynamic obj) {
    this._id = obj['id'];
    this._nome = obj['nome'];
    this._descricao = obj['descricao'];
    this._codreceita = obj['codreceita'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["nome"] = _nome;
    map["descricao"] = _descricao;
    map["codreceita"] = _codreceita;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Receita.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._nome = map["nome"];
    this._descricao = map["descricao"];
    this._codreceita = map["codreceita"];
  }
}