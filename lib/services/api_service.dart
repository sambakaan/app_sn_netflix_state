import 'package:dio/dio.dart';

import './api.dart';

class APIService {
  final api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    final String _url = api.baseURL + path;

    Map<String, dynamic> query = {
      'api_key': api.apiKey,
      'language': 'fr-FR',
    };

    if (params != null) {
      query.addAll(params);
    }

    final response = await dio.get(_url, queryParameters: query);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }
}
