import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kbs_css/controller/forget_password_controller.dart';

import '../Keys.dart';

class ForgetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          GetBuilder<ForgetPasswordController>(
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
                        'Forget Password',
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
                        controller: controller.userEmailTextEditingController,
                        validator: (value) {
                          return value == null
                              ? 'Enter User Email'
                              : (2 <= value.length || value.length >= 10)
                                  ? null
                                  : 'Enter Your Email';
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          isDense: true,
                          labelText: 'Enter Your Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email_outlined,
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
                      controller.isLoading
                          ? const CupertinoActivityIndicator(
                              radius: 15,
                            )
                          : SizedBox(
                              width: 400,
                              child: MaterialButton(
                                child: const Text(
                                  'Send Verification Code',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                color: Keys.primaryColor,
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();
                                  controller.isFormValidated = true;
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.isLoading = true;
                                    await controller.forgetPassword();
                                    controller.userEmailTextEditingController
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
