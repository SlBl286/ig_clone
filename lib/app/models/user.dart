class User {
  late String? name;
  late String? email;
  late String? nickname;
  late String? avatar;
  late String? bio;
  late String? website;
  late List<int>? followers;
  late List<int>? following;
  late List<int>? posts;
  late int? gender;

  User.fromJson(dynamic data) {
    this.name = data['name'];
    this.email = data['email'];
    this.nickname = data['nickname'];
    this.avatar = data['avatar'];
    this.bio = data['bio'];
    this.website = data['website'];

    this.followers = data['followers'].cast<int>();
    this.following = data['following'].cast<int>();
    this.posts = data['posts'].cast<int>();
    this.gender = data['gender'] ?? 0;
  }

  toJson() => {
        "name": this.name,
        "email": this.email,
        "nickname": this.nickname,
        "avatar": this.avatar,
        "bio": this.bio,
        "website": this.website,
        "followers": this.followers,
        "following": this.following,
        "posts": this.posts,
        "gender": this.gender
      };
}
