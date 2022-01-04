import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';

import '../Keys.dart';
import 'admin/admin_home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          Material(
            elevation: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 100,
              ),
              color: Colors.grey.shade100,
              width: 400,
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(labelText: 'User name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Keys.primaryColor,
                    onPressed: () {
                      Get.to((AdminHomePage()));
                    },
                    height: 40,
                    minWidth: 100,
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
