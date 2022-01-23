import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/Keys.dart';
import 'package:kbs_css/controller/login_controller.dart';
import 'package:kbs_css/view/forget_password_page.dart';

import '../Keys.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.grey,
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
                    vertical: 50,
                  ),
                  color: Colors.grey.shade100,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: controller.userIdTextEditingController,
                        validator: (value) {
                          return value == null
                              ? 'Enter User Id'
                              : (2 <= value.length || value.length >= 10)
                                  ? null
                                  : 'Enter Your Id';
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Enter Your ID',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.person_outlined,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
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
                        obscureText: !controller.isPasswordShow,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Enter Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(
                            Icons.lock_outlined,
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 14,
                          ),
                          suffixIcon: controller.isPasswordShow
                              ? InkWell(
                                  onTap: () => controller.isPasswordShow =
                                      !controller.isPasswordShow,
                                  child: const Icon(
                                    Icons.visibility_off_outlined,
                                  ),
                                )
                              : InkWell(
                                  onTap: () => controller.isPasswordShow =
                                      !controller.isPasswordShow,
                                  child: const Icon(
                                    Icons.visibility_outlined,
                                  ),
                                ),
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
                      controller.isUserIdOrPasswordIncorrect
                          ? Row(
                              children: [
                                Text(
                                  'Your User Id or Password is incorrect!',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red.shade800,
                                  ),
                                )
                              ],
                            )
                          : Container(),
                      controller.isUserIdOrPasswordIncorrect
                          ? const SizedBox(
                              height: 20,
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.to(
                              ForgetPasswordPage(),
                              transition: Transition.cupertino,
                            ),
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.redAccent.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      controller.isLoading
                          ? const CupertinoActivityIndicator(
                              radius: 15,
                            )
                          : SizedBox(
                              width: 400,
                              child: MaterialButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(
                                      Icons.login_outlined,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  ],
                                ),
                                color: Keys.primaryColor,
                                onPressed: () async {
                                  controller.isUserIdOrPasswordIncorrect =
                                      false;
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
                                height: 50,
                                minWidth: 100,
                              ),
                            ),
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
