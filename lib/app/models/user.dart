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

    this.followers =
        data['followers'] != null ? data['followers'].cast<int>() : null;
    this.following =
        data['following'] != null ? data['following'].cast<int>() : null;
    this.posts = data['followers'] != null ? data['posts'].cast<int>() : null;
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
