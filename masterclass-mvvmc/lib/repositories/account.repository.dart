import 'package:masterclass/models/user.model.dart';
import 'package:masterclass/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(new Duration(milliseconds: 1500));

    return UserModel(
      id: '1',
      name: 'Paulo Coutinho',
      email: 'paulo@prsolucoes.com',
      picture: 'https://picsum.photos/200/200',
      role: 'student',
      token: 'token-123',
    );
  }
}
