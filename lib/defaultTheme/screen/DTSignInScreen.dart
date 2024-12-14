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

import 'package:prokit_flutter/services/auth_service.dart'; // Asegúrate de importar el archivo donde creamos AuthService

class DTSignInScreen extends StatefulWidget {
  static String tag = '/DTSignInScreen';

  @override
  DTSignInScreenState createState() => DTSignInScreenState();
}

class DTSignInScreenState extends State<DTSignInScreen> {
  bool obscureText = true;
  final _authService = AuthService(); // Instancia del servicio de autenticación
  bool isLoading = false; // Bandera para mostrar el indicador de carga

  bool autoValidate = false;

  var emailCont = TextEditingController();
  var passCont = TextEditingController();

  var passFocus = FocusNode();

  @override
  void initState() {
    super.initState();

  }

  Future<void> handleSignIn() async {
  final email = emailCont.text.trim(); // Obtén el email del campo de texto
  final password = passCont.text.trim(); // Obtén la contraseña del campo de texto

  if (email.isEmpty || password.isEmpty) {
    setState(() => autoValidate = true); // Habilita la validación visual
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in all fields'),
        backgroundColor: Colors.red,
      ),
    );
    return;
  }

  setState(() => isLoading = true); // Cambiar el estado a "cargando"

  try {
    final response = await _authService.login(email, password); // Llama al servicio

    // Extraer y guardar el token de acceso si la autenticación es exitosa
    final token = response['access_token'];
    if (token != null) {
      await setValue('access_token', token); // Guarda el token en el almacenamiento local (usando nb_utils)

      // Navegar al dashboard si la autenticación es exitosa
      DTDashboardScreen().launch(context, isNewTask: true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Authentication failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } on Exception catch (e) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Authentication failed'),
        backgroundColor: Colors.red,
      ),
    );

    //Depuración: toast('Error: $e'); 

  } finally {
    setState(() => isLoading = false); // Cambiar el estado a "no cargando"
  }
}


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0), 
                      borderSide: BorderSide(color: appStore.textSecondaryColor!),
                    ),
                    errorText: autoValidate && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailCont.text.trim())
                      ? 'Invalid email address' // Mensaje de error si el email es inválido
                      : null,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    setState(() {
                      autoValidate = !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim());
                    });
                  },
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0), 
                      borderSide: BorderSide(color: appStore.textSecondaryColor!),
                    ),
                    errorText: autoValidate && passCont.text.trim().isEmpty
                      ? 'Password is required'
                      : null, // Valida campo vacío
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
                  decoration: BoxDecoration(color: isLoading ? Colors.grey : appColorPrimary,
                    borderRadius: BorderRadius.circular(8), 
                    boxShadow: defaultBoxShadow()),
                  child: isLoading
                  ? CircularProgressIndicator(color: Colors.white) // Indicador de carga
                  : Text('Sign In', style: boldTextStyle(color: white, size: 18)),
                  
                ).onTap(() {
                  if (!isLoading) handleSignIn(); // Evita clics múltiples
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
