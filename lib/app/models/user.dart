class User {
  late String? name;
  late String email;
  late String? nickname;
  late String? avatar;
  late String? bio;
  late String? website;

  User.fromJson(dynamic data) {
    this.name = data['name'];
    this.email = data['email'];
    this.nickname = data['nickname'];
    this.avatar = data['avatar'];
    this.bio = data['bio'];
    this.website = data['website'];
  }

  toJson() => {
        "name": this.name,
        "email": this.email,
        "nickname": this.nickname,
        "avatar": this.avatar,
        "bio": this.bio,
        "website": this.website
      };
}
