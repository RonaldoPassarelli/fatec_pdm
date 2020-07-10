
class Ingrediente {
  //Atributos
  String _id;
  String _codigo;
  String _descricao;
  String _unidade;
  String _valor;

  //Construtor
  Ingrediente(this._id, this._codigo, this._descricao, this._unidade, this._valor);

  //Getters
  String get id => _id;
  String get codigo => _codigo;
  String get descricao => _descricao;
  String get unidade => _unidade;
  String get valor => _valor;
  Ingrediente.map(dynamic obj) {
    this._id = obj['id'];
    this._codigo = obj['codigo'];
    this._descricao = obj['descricao'];
    this._unidade = obj['unidade'];
    this._valor = obj['valor'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["codigo"] = _codigo;
    map["descricao"] = _descricao;
    map["unidade"] = _unidade;
    map["valor"] = _valor;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Ingrediente.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._codigo = map["codigo"];
    this._descricao = map["descricao"];
    this._unidade = map["unidade"];
    this._valor = map["valor"];
  }
}