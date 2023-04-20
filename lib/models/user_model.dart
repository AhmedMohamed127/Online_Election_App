class UserModel {
  late String email;
  late String name;
  late String team;

  UserModel({
    required this.email,
    required this.name,
    required this.team,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    team = json['team'];
  }

  Map<String, dynamic> toMap() {
    return {'email': email,
      'name': name,
      'team': team
    };
  }
}
