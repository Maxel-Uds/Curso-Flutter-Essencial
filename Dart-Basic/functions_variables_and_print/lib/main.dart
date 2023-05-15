void main() {
  var pessoa = Pessoa("Maxel");
  int a = 1;
  int b = 2;

  var calc = Calculadora();
  int c = calc.soma(a, b);

  print("Soma: $c");
  print("Nome: ${pessoa.nome}");
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
