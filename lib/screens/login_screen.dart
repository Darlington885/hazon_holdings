import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hazon_holdings/screens/register_screen.dart';
import 'package:hazon_holdings/store/login_store/login_store.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/image_asset.dart';
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
  TextEditingController  passwordController = TextEditingController();
  bool passwordVisible = false;
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:AppColors.lightPurpleColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 250.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [


                Center(
                  child: Text(
                    'HAZON\nHOLDINGS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
              ),
              child:  ListView(
                children: [
                  const Text(
                    "welcome Back, Augus Jared Mark",
                    style: TextStyle(
                        fontFamily: AppFonts.Cabinet_Grotesk,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        color: AppColors.textColor2),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),

                  const SizedBox(
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
                      child: const Text(
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
                  const SizedBox(
                    height: 80.0,
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
                            if(store.hasErrors){
                              return;
                            }else{
                              Navigator.pushNamed(context, RegisterScreen.routeName);
                            }
                          },
                          loading: store.loading,
                          loaderColor: Colors.white,
                          textColor: Colors.white,
                          color: AppColors.lightPurpleColor),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFonts.Cabinet_Grotesk,
                              fontStyle: FontStyle.normal),
                          children: <TextSpan>[
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
            ),
          ),
        ],
      ),
    );
  }
}
