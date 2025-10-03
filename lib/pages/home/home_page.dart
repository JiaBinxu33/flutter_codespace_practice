import 'package:flutter/material.dart';
import 'package:flutter_codespace_practice/pages/home/home_vm.dart';
import 'package:flutter_codespace_practice/pages/web_view_page.dart';
import 'package:flutter_codespace_practice/route/RouteUtils.dart';
import 'package:flutter_codespace_practice/route/routes.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    HomeViewModel.getBanner();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _banner(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _listItemView();
              },
              itemCount: 10,
            )
          ],
        ),
      ),
    ));
  }

  Widget _listItemView() {
    return GestureDetector(
      onTap: () => {
        RouteUtils.pushForNamed(context, RoutePaths.webViewPage,
            arguments: {"title": "webView"})
        // RouteUtils.push(context, WebViewPage(title: "webView",))
        // Navigator.pushNamed(context, RoutePaths.webViewPage)
        // Navigator.push(context, MaterialPageRoute(builder: (context){
        //   return WebViewPage(title: "webView",);
        // }))
      },
      child: Container(
          margin:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(6.r))),
          child: Column(children: [
            Row(
              // padding:16.r,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    "assets/images/luoxiaohei.png",
                    width: 30.r,
                    height: 30.r,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "作者",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(child: SizedBox()),
                Text("2025年10月1日20:46:41",
                    style: TextStyle(color: Colors.black)),
                SizedBox(
                  width: 5.w,
                ),
                Text("置顶",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              ],
            ),
            Text(
                "Recompile complete. Page requires refresh.Performing hot restart...34msRestarted application in 35ms.",
                style: TextStyle(color: Colors.black, fontSize: 14.sp)),
            Row(
              children: [
                Text("干货资源",
                    style: TextStyle(color: Colors.green, fontSize: 12.sp)),
                Expanded(child: SizedBox()),
                Image.asset(
                  "assets/images/img_collect_grey.png",
                  width: 30.r,
                  height: 30.r,
                )
              ],
            )
          ])),
    );
  }

  Widget _banner() {
    return Container(
        height: 150.h,
        width: double.infinity,
        child: Swiper(
          itemCount: 3,
          autoplay: true,
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          indicatorLayout: PageIndicatorLayout.NONE,
          itemBuilder: (context, index) {
            return Container(
              height: 150,
              color: Colors.blue,
            );
          },
        ));
  }
}
