import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hazon_holdings/constants/image_asset.dart';
import 'package:hazon_holdings/screens/login_screen.dart';
import 'package:hazon_holdings/utils/navigators.dart';

import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../constants/text_string.dart';
import '../store/register_store/register_store.dart';
import '../utils/alert_dialog.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

RegisterStore registerStore = RegisterStore();
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


  @override
  void initState() {
     registerStore.setupValidations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPurpleColor,
        leading:  InkWell(
          onTap: () {
            popView(context);
          },
          child: Container(
            decoration: BoxDecoration(
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset(

                assetBackArrow,
                height: 18.95,
                width: 10.85,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        title: const Text(
          "Sign Up",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              fontStyle: FontStyle.normal,
              color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24),
        children: [
        FittedBox(
          child: const Text(
            accountText,
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: AppFonts.Cabinet_Grotesk,
                fontWeight: FontWeight.w700,
                fontSize: 16,
                fontStyle: FontStyle.normal,
                color: AppColors.textColor2),
          ),
        ),
        const Text(
          "Fielda marked(*) are required",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: AppColors.textColor2),
        ),
        const SizedBox(height: 20,),
        const Text(
          "First Name",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: AppColors.textColor2),
        ),
        const SizedBox(height: 5.0,),
        Observer(
          builder: (_) =>InputField(
            controller: firstNameController,
            type: TextInputType.text,
            hint: 'Enter First Name',
            onChanged: (text) {
              registerStore.firstName = text;


            },

            message: registerStore.error.firstName,
            error: registerStore.error.firstName!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),

        //SizedBox(height: 5.0,),
        const Text(
          "Last Name",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: AppColors.textColor2),
        ),
        const SizedBox(height: 5.0,),
        Observer(
          builder: (_) =>InputField(
            controller: lastNameController,
            type: TextInputType.text,
            hint: 'Last Name',
            onChanged: (text) {
              registerStore.lastName = text;


            },

            message: registerStore.error.lastName,
            error: registerStore.error.lastName!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        // SizedBox(height: 10.0,),

        //SizedBox(height: 5.0,),

      Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Date of Birth",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: AppFonts.Cabinet_Grotesk,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: AppColors.textColor2),
              ),
              Observer(
                builder: (_) =>InputField(
                  controller: dobController,
                  type: TextInputType.datetime,
                  hint: 'Date of Birth',
                  onChanged: (text) {
                     registerStore.dob = text;


                  },

                  message: registerStore.error.dob,
                  error: registerStore.error.dob!= null,
                  color: AppColors.textColor3,
                  hintColor: AppColors.hintColor,
                  textColor: AppColors.textColor3,
                  focusedColor: AppColors.hintColor,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Gender",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: AppFonts.Cabinet_Grotesk,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontStyle: FontStyle.normal,
                    color: AppColors.textColor2),
              ),
              Observer(
                builder: (_) =>InputField(
                  controller: genderController,
                  type: TextInputType.text,
                  hint: 'Select Gender',
                  onChanged: (text) {
                  registerStore.gender = text;


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
                      registerStore.gender = newValue;

                      }
                  ),
                  message: registerStore.error.gender,
                  error: registerStore.error.gender!= null,
                  color: AppColors.textColor3,
                  hintColor: AppColors.hintColor,
                  textColor: AppColors.textColor3,
                  focusedColor: AppColors.hintColor,
                ),
              ),
            ],
          ),
        ),
      ],),
SizedBox(height: 5,),
        Text(
          "Email",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: AppColors.textColor2),
        ),
        SizedBox(height: 5.0,),
        Observer(
          builder: (_) =>InputField(
            controller: emailController,
            type: TextInputType.emailAddress,
            hint: 'Enter a valid email address',
            onChanged: (text) {
              registerStore.email= text;

            },

            message: registerStore.error.email,
            error: registerStore.error.email!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),
        //SizedBox(height: 5.0,),
        Text(
          "Password",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: AppFonts.Cabinet_Grotesk,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              fontStyle: FontStyle.normal,
              color: AppColors.textColor2),
        ),
        SizedBox(height: 5.0,),
        Observer(
          builder: (_) =>InputField(
            controller: passwordController,
            type: TextInputType.text,
            hint: 'Enter your Password',
            onChanged: (text) {
              registerStore.password = text;

            },

            message: registerStore.error.password,
            error: registerStore.error.password!= null,
            color: AppColors.textColor3,
            hintColor: AppColors.hintColor,
            textColor: AppColors.textColor3,
            focusedColor: AppColors.hintColor,
          ),
        ),



        SizedBox(height: 40.0,),
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
if(registerStore.hasErrors){
  return;
}else{
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
}





              },
              //loading: registerStore.loading,
              loaderColor: Colors.white,
              textColor: Colors.white,
              color:  AppColors.lightPurpleColor
          ),
        ),
      ],),
    );
  }
}
