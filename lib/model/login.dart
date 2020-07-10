class Usuarios {
  //Atributos
  String _id;
  String _login;
  String _senha;


  //Construtor
  Usuarios(this._id, this._login, this._senha);

  //Getters
  String get id => _id;
  String get login => _login;
  String get senha => _senha;

  Usuarios.map(dynamic obj) {
    this._id = obj['id'];
    this._login = obj['login'];
    this._senha = obj['senha'];

  }

  //Converter os dados para um Mapa
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map["id"] = _id;
    }
    map["login"] = _login;
    map["senha"] = _senha;
 
    return map;
  }

  //Converter um Mapa para o modelo de dados
  Usuarios.fromMap(Map<String, dynamic> map, String id) {
    //Atribuir id ao this._id, somente se id não for
    //nulo, caso contrário atribui '' (vazio).
    this._id = id ?? '';
    this._login = map["login"];
    this._senha = map["senha"];
  }
}