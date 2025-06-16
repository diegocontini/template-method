abstract class Pagamento {
  void execute({required double amount, required String token}) {
    autenticar(token);
    realizarPagamento(amount);
    confirmarPagamento();
  }

  void autenticar(String token) {
    print("Autenticando com o token: $token");
    if (token.isEmpty) {
      throw Exception("Authentication failed: Token is invalid.");
    }
  }

  void realizarPagamento(double amount);

  void confirmarPagamento() {
    print("Pagamento confirmado.");
  }
}

class Cartao extends Pagamento {
  @override
  void realizarPagamento(double amount) {
    print("Processando pagamento com Cartão no valor de R\$ $amount");
  }
}

class BoletoBancario extends Pagamento {
  @override
  void realizarPagamento(double amount) {
    print("Gerando boleto bancário no valor de R\$ $amount");
  }
}

void main() {
  Pagamento cartao = Cartao();
  cartao.execute(amount: 100.0, token: "12345");

  Pagamento boleto = BoletoBancario();
  boleto.execute(amount: 50.0, token: "67890");
}
