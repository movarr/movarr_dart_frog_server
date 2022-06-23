import 'dart:io';
import 'dart:typed_data';

class FsUtils {
  ///Write raw bytes to file on disk
  /// accepts Unit32List
  /// path where to save the file on disk
  /// name is name of file saved on disk
  /// extension under which file will be saved normally should be as the extension received
  Future<int> saveFile({
    required Uint32List rawFile,
    required String path,
    required String name,
    required String extension,
  }) async {
    try {
      final File file = File(path + name + extension);
      await file.writeAsBytes(rawFile);
    } catch (e) {
      print(e.toString());
      return -1;
    }
    return 0;
  }

  Future<int> saveJson({
    required String jsonString,
    required String path,
    required String name,
    String extension = '.json',
  }) async {
    try {
      final File file = File(path + name + extension);
      await file.writeAsString(jsonString);
    } catch (e) {
      print(e.toString());
      return -1;
    }
    return 0;
  }
}
