import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hazon_holdings/constants/image_asset.dart';
import 'package:hazon_holdings/utils/navigators.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/text_string.dart';
import '../store/register_store/register_store.dart';
import '../utils/alert_dialog.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'login_screen.dart';
//RegisterStore registerStore = RegisterStore();
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);
  static const routeName = 'register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String title = "";
  String item1 = "Male";
  String item2 = "Female";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {

    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    genderController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  // @override
  // void initState() {
     //registerStore.setupValidations();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child:ListView(children: [

          Container(

            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, top: 40, right: 8, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          popView(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              assetBackArrow,
                              height: 18.95,
                              width: 10.85,
                              //color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: AppFonts.Cabinet_Grotesk,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),
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
          ),
          Text(
            accountText,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontStyle: FontStyle.normal,
                color: AppColors.textColor2),
          ),
          Text(
            "Fielda marked(*) are required",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontStyle: FontStyle.normal,
                color: AppColors.textColor2),
          ),
          SizedBox(height: 20,),

          Observer(
            builder: (_) =>InputField(
              controller: firstNameController,
              type: TextInputType.text,
              hint: 'Enter First Name',
              onChanged: (text) {
                //registerStore.firstName = text;


              },
              prefixIcon: Padding(
                //padding: const EdgeInsets.only(left: 20, right: 4),
                padding: const EdgeInsets.all(15),
                child:   Image.asset(assetPerson, height: 18, width: 18,),
              ),
              // message: registerStore.error.firstName,
              // error: registerStore.error.firstName!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),

          //SizedBox(height: 5.0,),
          Observer(
            builder: (_) =>InputField(
              controller: lastNameController,
              type: TextInputType.text,
              hint: 'Last Name',
              onChanged: (text) {
                //registerStore.lastName = text;


              },
              prefixIcon: Padding(
                //padding: const EdgeInsets.only(left: 20, right: 4),
                padding: const EdgeInsets.all(15),
                child:   Image.asset(assetPerson, height: 18, width: 18,),
              ),
              // message: registerStore.error.lastName,
              // error: registerStore.error.lastName!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),
          // SizedBox(height: 10.0,),

          Observer(
            builder: (_) =>InputField(
              controller: dobController,
              type: TextInputType.phone,
              hint: 'Phone Number',
              onChanged: (text) {
                //registerStore.phoneNumber = text;


              },
              prefixIcon: Padding(
                //padding: const EdgeInsets.only(left: 20, right: 4),
                padding: const EdgeInsets.all(15),
                child:   Image.asset(assetPhone, height: 18, width: 18,),
              ),
              // message: registerStore.error.dobController,
              // error: registerStore.error.dobController!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),
          //SizedBox(height: 5.0,),

        Row(children: [
          Observer(
            builder: (_) =>InputField(
              controller: dobController,
              type: TextInputType.text,
              hint: 'Select Gender',
              onChanged: (text) {
                // registerStore.invite_code = text;


              },
              suffixIcon: PopupMenuButton(padding: EdgeInsets.only(right: 25),
                  icon:Icon(Icons.arrow_drop_down_outlined,),
                  itemBuilder: (context){
                    return [
                      PopupMenuItem(value: item1,child: Text(item1),),
                      PopupMenuItem(value: item2,child: Text(item2),
                      ),
                    ];
                  },
                  onSelected: (String newValue){
                    setState(() {
                      title = newValue;
                      dobController.text=title;
                    });
                    //store.gender = newValue;

                  }
              ),
              // message: registerStore.error.invite_code,
              // error: registerStore.error.invite_code!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),
          Observer(
            builder: (_) =>InputField(
              controller: genderController,
              type: TextInputType.text,
              hint: 'Select Gender',
              onChanged: (text) {
                // registerStore.invite_code = text;


              },
              suffixIcon: PopupMenuButton(padding: EdgeInsets.only(right: 25),
                  icon:Icon(Icons.arrow_drop_down_outlined,),
                  itemBuilder: (context){
                    return [
                      PopupMenuItem(value: item1,child: Text(item1),),
                      PopupMenuItem(value: item2,child: Text(item2),
                      ),
                    ];
                  },
                  onSelected: (String newValue){
                    setState(() {
                      title = newValue;
                      genderController.text=title;
                    });
                    //store.gender = newValue;

                  }
              ),
              // message: registerStore.error.invite_code,
              // error: registerStore.error.invite_code!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),
        ],),
SizedBox(height: 5,),
          Observer(
            builder: (_) =>InputField(
              controller: emailController,
              type: TextInputType.text,
              hint: 'Enter a valid email address',
              onChanged: (text) {
                //registerStore.password = text;

              },
              prefixIcon: Padding(
                //padding: const EdgeInsets.only(left: 20, right: 4),
                padding: const EdgeInsets.all(15),
                child:   Image.asset(assetLock, height: 18, width: 18,),
              ),
              // message: registerStore.error.password,
              // error: registerStore.error.password!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),
          //SizedBox(height: 5.0,),
          Observer(
            builder: (_) =>InputField(
              controller: passwordController,
              type: TextInputType.text,
              hint: 'Password',
              onChanged: (text) {
                //registerStore.password = text;

              },
              prefixIcon: Padding(
                //padding: const EdgeInsets.only(left: 20, right: 4),
                padding: const EdgeInsets.all(15),
                child:   Image.asset(assetLock, height: 18, width: 18,),
              ),
              // message: registerStore.error.password,
              // error: registerStore.error.password!= null,
              color: AppColors.textColor3,
              hintColor: AppColors.hintColor,
              textColor: AppColors.textColor3,
              focusedColor: AppColors.hintColor,
            ),
          ),

          // SizedBox(height: 10,),
          // Center(
          //   child: InkWell(
          //     child: RichText(
          //       text: TextSpan(
          //         text: 'By Signing Up , You’re agreeing to our',
          //         style: TextStyle(
          //             color: AppColors.textColor,
          //             fontSize: 12.0,
          //             fontWeight: FontWeight.w500,
          //             fontFamily: AppFonts.Cabinet_Grotesk,
          //             fontStyle: FontStyle.normal
          //         ),
          //         children: const <TextSpan>[
          //           TextSpan(
          //               text: ' Terms and\nConditions and Privacy Policy', style: TextStyle(
          //               color: AppColors.lightPurpleColor,
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.w500,
          //               fontFamily: AppFonts.Cabinet_Grotesk,
          //               fontStyle: FontStyle.normal)),
          //         ],
          //       ),
          //     ),
          //     onTap: () {
          //       Navigator.pushNamed(
          //           context, CreateAccountScreen.routeName);
          //     },
          //   ),
          // ),

          SizedBox(height: 120.0,),
          Container(
            height: 54,
            decoration: BoxDecoration(border: Border.all(color: AppColors.lightPurpleColor, ),
                borderRadius: BorderRadius.circular(24.0)
            ),
            width: double.infinity,
            child: Button(
                text: 'Submit',
                onPressed:  () {
                  FocusScope.of(context).unfocus();

                  openDialog(
                      CustomPopupDialog(
                        title: regSuccess,
                        description: regSuccessDesc,
                        buttonText: "Continue",
                        img: assetImageThumbs,
                        onButtonPressed: (){
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                      ),

                      context);
                  //
                  // if(firstNameController.text == null || firstNameController.text == ""){
                  //   registerStore.error.firstName = "Please enter firstName";
                  // }else if(lastNameController.text == null || lastNameController.text == ""){
                  //   registerStore.error.lastName = "Please enter lastName";
                  // }else if(phoneController.text == null || phoneController.text == ""){
                  //   registerStore.error.phoneNumber = "Please enter Phone Number";
                  // }else if(inviteController.text == null || inviteController.text == ""){
                  //   registerStore.error.invite_code = "Please enter Invite Code";
                  // }else if(passwordController.text == null || passwordController.text == ""){
                  //   registerStore.error.password = "Please enter Password";
                  // }
                  // else {
                  //   openDialog(
                  //       CustomPopupDialog(
                  //         title: regSuccess,
                  //         description: regSuccessDesc,
                  //         buttonText: "Continue",
                  //         img: assetImageThumbs,
                  //         onButtonPressed: (){
                  //           Navigator.pushNamed(context, LoginScreen.routeName);
                  //         },
                  //       ),
                  //
                  //       context);
                  // }


                },
                //loading: registerStore.loading,
                loaderColor: Colors.white,
                textColor: Colors.white,
                color:  AppColors.lightPurpleColor
            ),
          ),
        ],),
      ),
    );
  }
}
