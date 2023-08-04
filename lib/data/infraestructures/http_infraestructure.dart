import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_certificate_pinning/http_certificate_pinning.dart';

mixin HttpInfraestructure {
  Dio http = Dio();

  Dio getClient(String baseUrl, {bool needPinning = true}) {
    Duration secs = const Duration(seconds: 30);
    var dio = Dio(BaseOptions(
        baseUrl: baseUrl, connectTimeout: secs, receiveTimeout: secs));
    if (needPinning) {
      dio.interceptors.add(CertificatePinningInterceptor(
          allowedSHAFingerprints: [dotenv.get("FINGER_PRINT")]));
    }
    return dio;
  }

  Future get(String url) async {
    Uri apiUrl = Uri.parse(url);
    String serverAPI = apiUrl.origin;
    http = getClient(serverAPI);
    final response = await http.get(url);
    return response.data;
  }
}
