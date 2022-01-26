import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/helper/cache_handler.dart';
import 'package:kbs_css/model/login.dart';
import 'package:kbs_css/view/admin/admin_home_page.dart';
import 'package:kbs_css/view/login_page.dart';
import 'package:kbs_css/view/user/user_home_page.dart';

import 'firebase_options.dart';
import 'helper/firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Firestore.config();
  runApp(MyApp());
  Hive.openBox('KBS');
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
    Widget child,
    AnimationController controller,
    AlignmentGeometry alignment,
  ) {
    double opacity = controller.value; //controller?.value ?? 0;
    return Opacity(
      opacity: opacity,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder(
        future: CacheStorage().getObject(Keys.loginUser),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data != null) {
              var user = Login.fromJson(snapshot.data);
              if (user.userType == UserType.admin.toString().split('.')[1]) {
                Get.to(AdminHomePage());
              } else {
                Get.to(UserHomePage());
              }
            } else {
              return const LoginPage();
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoActivityIndicator();
          } else {
            return const LoginPage();
          }

          return const LoginPage();
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}
