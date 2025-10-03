import 'package:flutter/material.dart';
import 'package:flutter_codespace_practice/route/RouteUtils.dart';
import 'package:flutter_codespace_practice/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_codespace_practice/pages/home_page.dart'; // 这是您自己的文件

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. 使用 ScreenUtilInit 包裹 MaterialApp
    return ScreenUtilInit(
      // 填入您 UI 设计稿的尺寸
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // builder 方法是必需的
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // 这里使用 builder 中的 child 参数
          navigatorKey: RouteUtils.navigatorKey,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: RoutePaths.home,
          // home: child,
        );
      },
      // 3. 把您的首页作为 child 传进去
      // child: const HomePage(),
    );
  }
}
