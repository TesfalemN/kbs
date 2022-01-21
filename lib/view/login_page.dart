import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/login_controller.dart';

import '../Keys.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          GetBuilder<LoginController>(
            builder: (controller) => Material(
              elevation: 1,
              child: Form(
                key: controller.formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 100,
                  ),
                  color: Colors.grey.shade100,
                  width: 400,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.userIdTextEditingController,
                        validator: (value) {
                          return value == null
                              ? 'Enter User Id'
                              : (2 <= value.length || value.length >= 10)
                                  ? null
                                  : 'Enter Employee Id';
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Enter Your ID here',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (controller.isFormValidated) {
                            controller.formKey.currentState!.validate();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller:
                            controller.userPasswordTextEditingController,
                        validator: (value) {
                          return value == null
                              ? 'Enter your Password'
                              : (2 <= value.length || value.length >= 10)
                                  ? null
                                  : 'Enter your Password';
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Enter Password here',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          if (controller.isFormValidated) {
                            controller.formKey.currentState!.validate();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      controller.isLoading
                          ? const CupertinoActivityIndicator(
                              radius: 15,
                            )
                          : MaterialButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: Keys.primaryColor,
                              onPressed: () async {
                                FocusScope.of(context).unfocus();
                                controller.isFormValidated = true;
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  controller.isLoading = true;
                                  await controller.loginUser();
                                  controller.userIdTextEditingController
                                      .clear();
                                  controller.userPasswordTextEditingController
                                      .clear();
                                  controller.isLoading = false;
                                }
                              },
                              height: 40,
                              minWidth: 100,
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
