import 'package:dio/dio.dart';

class HomeViewModel {
  // 从编译时环境中获取 Codespace 的名称
  static const String _codespaceName = String.fromEnvironment('CODESPACE_NAME');

  static Future getBanner() async {
    // 1. 动态构建代理服务器的地址
    //    如果获取到了 codespace 名称，就使用它来构建 URL，否则使用备用的本地地址
    final String proxyUrl = _codespaceName.isNotEmpty
        ? 'https://$_codespaceName-8080.app.github.dev'
        : 'http://localhost:8080';

    Dio dio = Dio(BaseOptions(
      baseUrl: proxyUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    print("--- 动态构建的代理地址是: $proxyUrl ---");

    try {
      Response response = await dio.get("/banner/json");
      
      print("请求成功，返回数据 ===> ${response.data}");
      return response.data;
    } catch (e) {
      print("请求失败，错误信息 ===> $e");
      return null;
    }
  }
}