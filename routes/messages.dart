import 'dart:ffi';
import 'dart:typed_data';

import 'package:dart_frog/dart_frog.dart';
import 'package:movarr_frog_server/utils/filesystem_utils.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final String filename = request.headers['filename'].toString();
  final String extension = request.headers['extension'].toString();
  final String md5Checksum = request.headers['md5'].toString();

  final String recievedJson = await request.body();

  //path should be a parameter passed by user
  FsUtils().saveJson(jsonString: recievedJson, name: filename, path: 'E:/');

  return Response(body: 'Messages Backups');
}
