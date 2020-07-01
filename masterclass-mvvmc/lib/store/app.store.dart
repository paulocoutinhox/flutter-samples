import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String picture = "https://placeholder.it/200";

  @observable
  String token = "";

  @action
  void setUser(String name, String email, String picture, String token) {
    this.name = name;
    this.email = email;
    this.picture = picture;
    this.token = token;
  }
}
