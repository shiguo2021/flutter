import 'package:dio/dio.dart';
import 'dart:io';
import 'dart:async';
import 'service_url.dart';

Future getHomeSwiper() async {
  try {
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType = Headers.formUrlEncodedContentType;
    // ContentType.parse("application/x-www-form-urlencoded");
    response = await dio.get(swiperUrl,
        queryParameters: {
          'advertiseStatus': 1,
          'advertiseType': 2,
          'communityId': 1805,
          'isPublic': 0,
          'pageNo': 1,
          'pageSize': 10
        },
        options: Options(headers: {
          'app-id': "1010",
          'authorization':
              "Bearer eyJhbGciOiJIUzUxMiJ9.eyJ1aWQiOjkyLCJ2IjoiMSIsInRpY2siOjM2LCJ0eXBlIjoxLCJhaWQiOiIxMDEwIn0.Lj7lMZUqBEUfbov98Hxeo8xM3mhlNF0eL-XKxJJ3lUXA9tBrVcVnJjm9wUcR95yjt6wSlZO9UpdeSfXtUNt1ng",
          'user-id': 92
        }));

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {}
}
