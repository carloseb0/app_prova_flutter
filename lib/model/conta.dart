import 'dart:ffi';

class Conta {
  String? id;
  String? nome;
  String? dapagamento;
  String? vlpagamento;
  String? flfinalizado;

  Conta() {
    id = "";
    nome = "";
    dapagamento = "";
    vlpagamento = "";
    flfinalizado = "";
  }

  Conta.init(this.id, this.nome, this.dapagamento, this.vlpagamento,
      this.flfinalizado);

  factory Conta.fromMap(Map<String, dynamic> json) {
    return Conta.init(json['id'], json['nome'], json['dapagamento'],
        json['vlpagamento'], json['flfinalizado']);
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'nome': nome,
        'dapagamento': dapagamento,
        'vlpagamento': vlpagamento,
        'flfinalizado': flfinalizado,
      };

  @override
  toString() {
    return '$nome - $dapagamento';
  }

  bool operator ==(other) {
    return (other is Conta && other.id == id);
  }
}
