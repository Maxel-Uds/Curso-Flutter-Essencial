void main() {
  var pessoa = Pessoa("Maxel");
  int a = 1;
  int b = 2;

  var calc = Calculadora();
  int c = calc.soma(a, b);

  print("Soma: $c");
  print("Nome: ${pessoa.nome}");

  //Listas
  var c1 = Carro("Celta");
  var c2 = Carro("Corsa");
  var c3 = Carro("Vectra");
  var c4 = Carro("Kombi");

  // List<Carro> carros = <Carro>[];
  var carros = [];
  carros.add(c1);
  carros.add(c2);
  carros.add(c3);
  carros.add(c4);

  for(Carro c in carros) {
    print("Nome: ${c.nome}");
  }
}

class Calculadora {
  int soma(int a, int b) {
    return a + b;
  }
}

class Pessoa {
  String nome;

  Pessoa(this.nome);
}

class Carro {
  String nome;

  Carro(this.nome);
}
