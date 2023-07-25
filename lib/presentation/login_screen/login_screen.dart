import 'package:beegains_login_test/core/app_export.dart';
import 'package:beegains_login_test/data/models/login_credentials.dart';
import 'package:beegains_login_test/presentation/login_screen/login_controller.dart';
import 'package:beegains_login_test/widgets/custom_button.dart';
import 'package:beegains_login_test/widgets/custom_icon_button.dart';
import 'package:beegains_login_test/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(left: 16, top: 68, right: 16),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CustomIconButton(
              height: 72,
              width: 72,
              variant: IconButtonVariant.FillLightblueA200,
              shape: IconButtonShape.RoundedBorder16,
              padding: IconButtonPadding.PaddingAll20,
              child: CustomImageView(svgPath: ImageConstant.imgCloseWhiteA700),
            ),
            Padding(
              padding: getPadding(top: 16),
              child: Text(
                "Welcome to Beegains",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsBold16
                    .copyWith(letterSpacing: getHorizontalSize(0.5)),
              ),
            ),
            Padding(
              padding: getPadding(top: 10),
              child: Text(
                "Sign in to continue",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsRegular12
                    .copyWith(letterSpacing: getHorizontalSize(0.5)),
              ),
            ),
            CustomTextFormField(
              focusNode: FocusNode(),
              controller: emailController,
              hintText: "Your username",
              margin: getMargin(top: 28),
              padding: TextFormFieldPadding.PaddingT14,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                margin: getMargin(left: 16, top: 12, right: 10, bottom: 12),
                child: CustomImageView(svgPath: ImageConstant.imgMail),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: getVerticalSize(48),
              ),
            ),
            CustomTextFormField(
              focusNode: FocusNode(),
              controller: passwordController,
              hintText: "Password",
              margin: getMargin(top: 10),
              padding: TextFormFieldPadding.PaddingT14,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                margin: getMargin(left: 16, top: 12, right: 10, bottom: 12),
                child: CustomImageView(svgPath: ImageConstant.imgLock),
              ),
              prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(48)),
              isObscureText: true,
            ),
            Consumer(
              builder: (context, ref, child) => GestureDetector(
                onTap: () => _loginUser(context, ref),
                child: LightBlueButton(
                  height: getVerticalSize(57),
                  text: "Sign In",
                  margin: getMargin(top: 16),
                ),
              ),
            ),
            Padding(
              padding: getPadding(top: 17),
              child: Text(
                "Forgot Password?",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPoppinsBold12
                    .copyWith(letterSpacing: getHorizontalSize(0.5)),
              ),
            ),
            Padding(
                padding: getPadding(top: 7, bottom: 5),
                child: RichText(
                    text: TextSpan(children: [
                      _text12size(text: "Don't have an account?"),
                      _text12size(text: " ", color: ColorConstant.indigoA200),
                      _text12size(
                          text: "Register", color: ColorConstant.lightBlueA200),
                    ]),
                    textAlign: TextAlign.left))
          ]),
        ),
      ),
    );
  }

  TextSpan _text12size({required String text, Color? color}) {
    return TextSpan(
        text: text,
        style: TextStyle(
            color: color ?? ColorConstant.blueGray300,
            fontSize: getFontSize(12),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            letterSpacing: getHorizontalSize(0.5)));
  }

  void _loginUser(BuildContext context, WidgetRef ref) async {
    final loginCred = LoginCredentials(
        username: emailController.text, password: passwordController.text);

    await ref.read(authenticationProvider.notifier).loginUser(loginCred);
  }
}
