import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDashboardScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTDrawerWidget.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTForgotPwdScreen.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTSignUpScreen.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class DTSignInScreen extends StatefulWidget {
  static String tag = '/DTSignInScreen';

  @override
  DTSignInScreenState createState() => DTSignInScreenState();
}

class DTSignInScreenState extends State<DTSignInScreen> {
  bool obscureText = true;
  bool autoValidate = false;

  var emailCont = TextEditingController();
  var passCont = TextEditingController();

  var passFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: DTDrawerWidget(),
      body: Center(
        child: Container(
          width: dynamicWidth(context),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Sign In', style: Theme.of(context).textTheme.titleLarge),
                30.height,
                TextFormField(
                  controller: emailCont,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    contentPadding: EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(passFocus),
                  textInputAction: TextInputAction.next,
                ),
                16.height,
                TextFormField(
                  obscureText: obscureText,
                  focusNode: passFocus,
                  controller: passCont,
                  style: primaryTextStyle(),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    contentPadding: EdgeInsets.all(16),
                    labelStyle: secondaryTextStyle(),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                    suffix: Icon(!obscureText ? Icons.visibility : Icons.visibility_off).onTap(() {
                      obscureText = !obscureText;
                      setState(() {});
                    }),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    DTForgotPwdScreen().launch(context);
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    alignment: Alignment.topRight,
                    child: Text("Forgot Password?", style: boldTextStyle(color: appColorPrimary)),
                  ),
                ),
                16.height,
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                  child: Text('Sign In', style: boldTextStyle(color: white, size: 18)),
                ).onTap(() {
                  //finish(context);
                  DTDashboardScreen().launch(context);

                  /// Remove comment if you want enable validation
                  /*if (formKey.currentState.validate()) {
                       formKey.currentState.save();
                       DTDashboardScreen().launch(context);
                     } else {
                       autoValidate = true;
                     }
                     setState(() {});*/
                }),
                10.height,
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: black,  // Puedes cambiarlo por el color que prefieras para el borde
                    ),
                    borderRadius: BorderRadius.circular(8), 
                    boxShadow: defaultBoxShadow()),
                  child: Text('Sign Up', 
                    style: boldTextStyle(
                      color: black,  // Color del texto (puedes cambiarlo a otro color)
                      size: 18
                    ),
                  ),
                  
                ).onTap(() {
                  DTSignUpScreen().launch(context);
                }),
                
                
              ],
            ),
          ).center(),
        ),
      ),
    );
  }
}
