import 'package:masterclass/models/user.model.dart';
import 'package:masterclass/repositories/account.repository.dart';
import 'package:masterclass/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository accountRepository;

  SignupController() {
    accountRepository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    var user = await AccountRepository().createAccount(model);
    return user;
  }
}
