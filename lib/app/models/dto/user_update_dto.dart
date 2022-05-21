class UserUpdateDto {
  late String? name;
  late String? nickname;
  late String? bio;
  late String? website;

  UserUpdateDto.fromJson(dynamic data) {
    this.name = data['name'];
    this.nickname = data['nickName'];
    this.bio = data['bio'];
    this.website = data['website'];
  }

  toJson() => {
        "name": this.name,
        "nickName": this.nickname,
        "bio": this.bio,
        "website": this.website
      };
}
