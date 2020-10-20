
class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        '}';
  }
}

class UserModel {
  String email;
  String icon;
  int id;
  String userName;
  String password;

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        icon = json['icon'],
        id = json['id'],
        userName = json['userName'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'icon': icon,
        'id': id,
        'userName': userName,
        'password': password
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"email\":\"$email\"");
    sb.write(",\"icon\":\"$icon\"");
    sb.write(",\"id\":$id");
    sb.write(",\"userName\":\"$userName\"");
    sb.write(",\"password\":\"$password\"");
    sb.write('}');
    return sb.toString();
  }
}
