import 'package:design_app/res/colors.dart';
import 'package:design_app/res/styles.dart';
import 'package:design_app/views/auth/widgets/auth_textfield.dart';
import 'package:design_app/views/designer_account/controller.dart';
import 'package:design_app/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DesignerAccountPage extends StatelessWidget {
  const DesignerAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DesignerAccountController>(
      builder: (_) {
        return _.isLoading.value
            ? Stack(
                children: [
                  Container(
                    color: Colors.white.withOpacity(0.4),
                    width: Get.width,
                    height: Get.height,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: pink,
                      ),
                    ),
                  )
                ],
              )
            : SingleChildScrollView(
                child: Center(
                child: SizedBox(
                  width: Get.width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.r.verticalSpace,
                      Text(_.username, style: poppins_samll_black),
                      15.r.verticalSpace,
                      Text(_.email, style: poppins_samll_black),
                      15.r.verticalSpace,
                      Text(_.address, style: poppins_samll_black),
                      15.r.verticalSpace,
                      Text(_.mobile, style: poppins_samll_black),
                      15.r.verticalSpace,
                      CustomButton(
                        text: 'Edit Account',
                        color: pink,
                        textStyle: poppins_xSamll_white,
                        width: double.infinity,
                        ontap: () {
                          Get.bottomSheet(BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Dialog(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Edit your account',
                                          style: poppins_xSamll_black_bold,
                                        ),
                                        15.r.verticalSpace,
                                        AuthTextfield(
                                          hint: 'Email',
                                          width: double.infinity,
                                          tec: _.newEmail,
                                        ),
                                        15.r.verticalSpace,
                                        AuthTextfield(
                                          hint: 'Username',
                                          width: double.infinity,
                                          tec: _.newUsername,
                                        ),
                                        15.r.verticalSpace,
                                        AuthTextfield(
                                          hint: 'Mobile',
                                          width: double.infinity,
                                          tec: _.newMobile,
                                          textInputType: TextInputType.number,
                                        ),
                                        15.r.verticalSpace,
                                        AuthTextfield(
                                          hint: 'Address',
                                          width: double.infinity,
                                          tec: _.newAddress,
                                        ),
                                        50.r.verticalSpace,
                                        CustomButton(
                                          color: light_pink,
                                          text: 'Update',
                                          textStyle: poppins_xxSamll_white,
                                          width: Get.width * 0.3,
                                          ontap: () {
                                            if (_.newUsername.text == '') {
                                              _.validation(
                                                  'Username cannot be empty',
                                                  red);
                                            } else if (_.newEmail.text == '') {
                                              _.validation(
                                                  'Email cannot be empty', red);
                                            } else if (_.newMobile.text == '') {
                                              _.validation(
                                                  'Moblie cannot be empty',
                                                  red);
                                            } else if (!(_.newEmail.text
                                                    .contains('@') ||
                                                _.newEmail.text
                                                    .contains('.'))) {
                                              _.validation(
                                                  'The email field must be a valid email address',
                                                  red);
                                            } else if (_.newAddress.text ==
                                                '') {
                                              _.validation(
                                                  'Address cannot be empty',
                                                  red);
                                            } else {
                                              _.updateAccount();
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ));
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        text: 'About',
                        color: pink,
                        textStyle: poppins_xSamll_white,
                        width: double.infinity,
                        ontap: () {
                          Get.toNamed('/about');
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        text: 'Contact us',
                        color: pink,
                        textStyle: poppins_xSamll_white,
                        width: double.infinity,
                        ontap: () {
                          Get.toNamed('/contact');
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        text: 'Delete Account',
                        color: pink,
                        textStyle: poppins_xSamll_white,
                        width: double.infinity,
                        ontap: () {
                          Get.defaultDialog(
                              confirm: CustomButton(
                                color: pink,
                                text: 'Nes',
                                textStyle: poppins_xxSamll_white,
                                ontap: () {
                                  // _.loadingToggle();
                                  // _.deleteAccountRequest();
                                },
                              ),
                              content: Text(
                                'Are you sure you want permanently delete this account ?',
                                style: poppins_xSamll_black,
                              ),
                              cancel: CustomButton(
                                color: pink,
                                text: 'No',
                                textStyle: poppins_xxSamll_white,
                              ),
                              contentPadding:
                                  const EdgeInsets.only(left: 25, bottom: 15));
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        text: 'Change password',
                        color: pink,
                        textStyle: poppins_xSamll_white,
                        width: double.infinity,
                        ontap: () {
                          Get.bottomSheet(BottomSheet(
                            onClosing: () {},
                            builder: (context) {
                              return SingleChildScrollView(
                                child: Dialog(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Change your password',
                                        style: poppins_xSamll_black_bold,
                                      ),
                                      15.r.verticalSpace,
                                      AuthTextfield(
                                        hint: 'Old Password',
                                        width: double.infinity,
                                        tec: _.currentPass,
                                        isObsecure: true,
                                      ),
                                      15.r.verticalSpace,
                                      AuthTextfield(
                                        isObsecure: true,
                                        hint: 'New Password',
                                        width: double.infinity,
                                        tec: _.newPass,
                                      ),
                                      15.r.verticalSpace,
                                      AuthTextfield(
                                        isObsecure: true,
                                        hint: 'New Password Confirmation',
                                        width: double.infinity,
                                        tec: _.newPassConfirmation,
                                      ),
                                      50.r.verticalSpace,
                                      CustomButton(
                                        color: light_pink,
                                        text: 'Confirm',
                                        textStyle: poppins_xxSamll_white,
                                        width: Get.width * 0.3,
                                        ontap: () {
                                          if (_.currentPass.text == '') {
                                            _.validation(
                                                'Please enter your current Password',
                                                red);
                                          } else if (_.newPass.text == '') {
                                            _.validation(
                                                'Please enter your new Password',
                                                red);
                                          } else if (_.newPass.text.length <
                                              8) {
                                            _.validation(
                                                'The new password field must be at least 8 characters',
                                                red);
                                          } else if (_.newPass.text !=
                                              _.newPassConfirmation.text) {
                                            _.validation(
                                                'Password confirmation doesn\'t match',
                                                red);
                                          } else {
                                            _.changePasswordRequest();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ));
                        },
                      ),
                      15.r.verticalSpace,
                      CustomButton(
                        text: 'Logout',
                        color: pink,
                        textStyle: poppins_xSamll_white,
                        width: double.infinity,
                        ontap: () {
                          _.loadingToggle();
                          _.logout();
                        },
                      ),
                      15.r.verticalSpace,
                    ],
                  ),
                ),
              ));
      },
    );
  }
}
