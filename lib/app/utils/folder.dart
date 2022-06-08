import 'dart:async';
import 'dart:io';

import 'package:external_path/external_path.dart';

class FolderUtils {
  static Future<List<String>> getFolderList() async {
    List<String> folderList = [];
    var dcimPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DCIM);
    var picPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_PICTURES);
    var dcimDir = Directory(dcimPath);
    var picDir = Directory(picPath);
    var dcimDirItems = await dcimDir.list(recursive: true).toList();

    for (var element in dcimDirItems) {
      if (element is Directory) {
        if (!element.path.split('/').last.startsWith("."))
          folderList.add(element.path.split('/').last);
      }
    }
    var picDirItems = await picDir.list(recursive: false).toList();
    for (var element in picDirItems) {
      if (element is Directory) {
        if (!element.path.split('/').last.startsWith("."))
          folderList.add(element.path.split('/').last);
      }
    }
    print(folderList.toSet().toList());
    return folderList;
  }

  static Future<List<File>> getListFiles(String path) async{
    Directory dir = new Directory(path);
    List<FileSystemEntity> files = dir.listSync(recursive: false);
    List<File> listFiles = [];
    for (FileSystemEntity file in files) {
      if (file is File) {
        listFiles.add(file);
      }
    }
    return listFiles;
  }
}
