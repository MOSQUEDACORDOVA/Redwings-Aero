import 'package:flutter/material.dart';
import 'package:prokit_flutter/defaultTheme/screen/DTSignInScreen.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailVerificationScreen extends StatelessWidget {
  static String tag = '/EmailVerificationScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                  'images/app/email_verification_screen.png', // Ruta de tu imagen
                  width: 100,            // Ancho de la imagen
                  fit: BoxFit.cover,     // Ajuste de la imagen
                ),
              32.height,

              Text('We have sent you a verification email.', 
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge),
                12.height,
              Text('Please check your inbox and verify your email to continue.', 
                  textAlign: TextAlign.center,
                  style: Theme. of(context).textTheme.displaySmall),
              64.height,

              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                decoration: BoxDecoration(color: appColorPrimary, 
                borderRadius: BorderRadius.circular(100), 
                boxShadow: defaultBoxShadow()),
                child: Text('Go to Login', 
                style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {
                    DTSignInScreen().launch(context, isNewTask: true);

                  }),

            ],
          ),
        ),
      ),
    );
  }
}
