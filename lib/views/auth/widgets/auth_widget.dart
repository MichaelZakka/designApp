import 'package:design_app/data/models/body/login_body.dart';
import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/auth/controller.dart';
import 'package:design_app/views/auth/widgets/auth_textfield.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AuthWidget extends StatelessWidget {
  final bool isLoging;
  const AuthWidget({super.key, required this.isLoging});

  @override
  Widget build(BuildContext context) {
    return isLoging
        ? GetBuilder<AuthController>(builder: (_) {
            return Container(
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  15.r.verticalSpace,
                  Text(
                    'Login',
                    style: poppins_samll_black,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Email',
                    tec: _.lEmail,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Password',
                    tec: _.lPassword,
                    isObsecure: true,
                  ),
                  15.r.verticalSpace,
                  _.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: purple,
                          ),
                        )
                      : CustomButton(
                          height: 45,
                          text: 'Login',
                          color: light_pink,
                          width: Get.width * 0.6,
                          ontap: () {
                            if (_.lEmail.text.isEmpty) {
                              _.validation('Email cannot be empty', red);
                            } else if (_.lPassword.text.isEmpty) {
                              _.validation('Password cannot be empty', red);
                            } else {
                              _.loadingToggle();
                              _.loginRequest(LoginBody(
                                  email: _.lEmail.text,
                                  password: _.lPassword.text));
                            }
                            // if (_.lEmail.text == 'admin') {
                            //   Get.offAllNamed('/admin');
                            // }
                          },
                          textStyle: poppins_xSamll_white_bold,
                        ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: const Divider(
                      thickness: 2,
                      color: black,
                    ),
                  ),
                  15.r.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: poppins_xxSamll_black,
                      ),
                      GestureDetector(
                        onTap: () {
                          _.loginToggle();
                        },
                        child: Text(
                          ' Sign up',
                          style: poppins_xxSamll_black_bold_underlined,
                        ),
                      ),
                    ],
                  ),
                  15.r.verticalSpace,
                ],
              ),
            );
          })
        : GetBuilder<AuthController>(builder: (_) {
            return Container(
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  15.r.verticalSpace,
                  Text(
                    'Sign up',
                    style: poppins_samll_black,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Username',
                    tec: _.rUsername,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Email',
                    tec: _.rEmail,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Password',
                    tec: _.rPassword,
                    isObsecure: true,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Confirm Password',
                    tec: _.rConfirmPass,
                    isObsecure: true,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Mobile Number',
                    tec: _.rMobileNumber,
                    textInputType: TextInputType.number,
                  ),
                  15.r.verticalSpace,
                  AuthTextfield(
                    hint: 'Address',
                    tec: _.rAddress,
                  ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Column(
                      children: _.groupValue.asMap().entries.map((entry) {
                        int index = entry.key;
                        String option = entry.value;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              option,
                              style: poppins_xSamll_black,
                            ),
                            Radio(
                              activeColor: light_pink,
                              value: index,
                              groupValue: _.selectedValue.value,
                              onChanged: (newvalue) {
                                _.updateValue(newvalue!);
                              },
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                  15.r.verticalSpace,
                  _.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: purple,
                          ),
                        )
                      : CustomButton(
                          color: light_pink,
                          height: 45,
                          text: 'Sign up',
                          width: Get.width * 0.6,
                          textStyle: poppins_xSamll_white_bold,
                          ontap: () {
                            if (_.rEmail.text.isEmpty) {
                              _.validation('Email cannot be empty', red);
                            } else if (_.rUsername.text.isEmpty) {
                              _.validation('Username cannot be empty', red);
                            } else if (_.rPassword.text.isEmpty) {
                              _.validation('Password cannot be empty', red);
                            } else if (_.rAddress.text.isEmpty) {
                              _.validation('Address cannot be empty', red);
                            } else if (_.rConfirmPass.text !=
                                _.rPassword.text) {
                              _.validation(
                                  'Password confirmation doesn\'t match', red);
                            } else {
                              _.loadingToggle();
                              _.signupRequest();
                            }
                          },
                        ),
                  15.r.verticalSpace,
                  SizedBox(
                    width: Get.width * 0.6,
                    child: const Divider(
                      thickness: 2,
                      color: black,
                    ),
                  ),
                  15.r.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: poppins_xxSamll_black,
                      ),
                      GestureDetector(
                        onTap: () {
                          _.loginToggle();
                        },
                        child: Text(
                          ' Login',
                          style: poppins_xxSamll_black_bold_underlined,
                        ),
                      ),
                    ],
                  ),
                  15.r.verticalSpace,
                ],
              ),
            );
          });
  }
}
