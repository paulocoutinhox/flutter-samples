class UserModel {
  String id;
  String name;
  String email;
  String picture;
  String role;
  String token;

  UserModel(
      {this.id, this.name, this.email, this.picture, this.role, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.picture;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }

  @override
  String toString() {
    return "UserModel: id=${this.id}, name=${this.name}, email=${this.email}, picture=${this.picture}, role=${this.role}, token=${this.token}";
  }
}
