
class Ingrediente {
  //Atributos
  String _id;
  String _codrec;
  String _ingrediente;
  String _unidade;
  int _valor;

  //Construtor
  Ingrediente(this._id, this._codrec, this._ingrediente, this._unidade, this._valor);

  //Getters
  String get id => _id;
  String get codrec => _codrec;
  String get ingrediente => _ingrediente;
  String get unidade => _unidade;
  int get valor => _valor;
  Ingrediente.map(dynamic obj) {
    this._id = obj['id'];
    this._codrec = obj['codrec'];
    this._ingrediente = obj['ingrediente'];
    this._unidade = obj['unidade'];
    this._valor = obj['valor'];
  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["codrec"] = _codrec;
    map["ingrediente"] = _ingrediente;
    map["unidade"] = _unidade;
    map["valor"] = _valor;
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Ingrediente.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._codrec = map["codrec"];
    this._ingrediente = map["ingrediente"];
    this._unidade = map["unidade"];
    this._valor = map["valor"];
  }
}