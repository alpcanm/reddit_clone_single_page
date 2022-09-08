import 'package:dio/dio.dart';

import '../../core/consts/network_const.dart';

class PostService {
  static Dio dio = Dio()..options.baseUrl = NetworkConst.BASE_URL;
  static Future<dynamic> getPosts() async {
    Response response = await dio.get(NetworkConst.FLUTTER_DEV_ENDPOINT);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}
