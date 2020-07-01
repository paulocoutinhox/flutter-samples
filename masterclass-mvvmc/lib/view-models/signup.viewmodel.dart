class SignupViewModel {
  String name = "Meu nome";
  String email = "paulo@prsolucoes.com";
  String password = "123456";
  bool busy = false;

  @override
  String toString() {
    return "SignupViewModel: name=${this.name}, email=${this.email}, password=${this.password}";
  }
}
