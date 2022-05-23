class Files {
  late List<String> files;
  late String folderName;

  Files.fromJson(Map<String, dynamic> json) {
    files = json['files'] as List<String>;
    folderName = json['folderName'] as String;
  }
}
