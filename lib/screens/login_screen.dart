import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hazon_holdings/constants/colors.dart';
import 'package:hazon_holdings/screens/register_screen.dart';

import '../constants/fonts.dart';
import '../constants/image_asset.dart';
import '../store/login_store/login_store.dart';
import '../utils/navigators.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static const routeName = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginStore store = LoginStore();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

 bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final deviceW = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: AppColors.lightPurpleColor,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    //Image.asset(assetGetStarted, width: 428, height: 192,),
                   Text("HAZON HOLDING"),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, top: 60, right: 8, bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              popView(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: AppFonts.Cabinet_Grotesk,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset(logoIcon,
                                height: 49,
                                width: 148.91,
                                color: AppColors.whiteColor),
                          ),
                          Text(
                            "",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                //   // width: size.width/1.07,
                //   width: deviceW / 1.07,
                //   height: 15,
                //   decoration: BoxDecoration(
                //       color: AppColors.whiteColor2.withOpacity(0.5),
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //       )),
                // ),
                Text("HAZON\nHOLDINGS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: AppFonts.Cabinet_Grotesk,
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      fontStyle: FontStyle.normal,
                      color: AppColors.textColor2),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 36.0),
                  height: 810,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(17),
                        topRight: Radius.circular(17),
                      )),
                  child: ListView(
                    children: [
                      Text(
                        "welcome Back, Augus Jared Mark",
                        style: TextStyle(
                            fontFamily: AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            color: AppColors.textColor2),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),

                      SizedBox(
                        height: 5.0,
                      ),
                      Observer(
                        builder: (_) => InputField(
                          controller: passwordController,
                          type: TextInputType.text,
                          hint: 'Password',
                          obscureText: passwordVisible,
                          onChanged: (text) {
                            store.password = text;
                          },
                          suffixIcon: passwordVisible
                              ? IconButton(
                            icon: Image.asset(
                              assetEyeOpen,
                              height: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = false;
                              });
                            },
                          )
                              : IconButton(
                            icon: Image.asset(
                              assetEyeClosed,
                              height: 20,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = true;
                              });
                            },
                          ),

                          message: store.error.password,
                          error: store.error.password != null,
                          color: AppColors.textColor3,
                          hintColor: AppColors.hintColor,
                          textColor: AppColors.textColor3,
                          focusedColor: AppColors.hintColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            //Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: AppColors.lightPurpleColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: AppFonts.Cabinet_Grotesk,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Observer(
                        builder: (ctx) => Container(
                          height: 54,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightPurpleColor,
                              ),
                              borderRadius: BorderRadius.circular(24.0)),
                          width: double.infinity,
                          child: Button(
                              text: 'LOG IN',
                              onPressed: () {
                                FocusScope.of(context).unfocus();

Navigator.pushNamed(context, RegisterScreen.routeName);

                              },
                              loading: store.loading,
                              loaderColor: Colors.white,
                              textColor: Colors.white,
                              color: AppColors.lightPurpleColor),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          child: RichText(
                            text: TextSpan(
                              text: "Don't have an account?",
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: AppFonts.Cabinet_Grotesk,
                                  fontStyle: FontStyle.normal),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: ' Sign Up',
                                    style: TextStyle(
                                        color: AppColors.lightPurpleColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: AppFonts.Cabinet_Grotesk,
                                        fontStyle: FontStyle.normal)),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
