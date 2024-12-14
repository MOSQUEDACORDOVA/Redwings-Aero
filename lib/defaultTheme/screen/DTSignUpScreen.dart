import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:prokit_flutter/main/utils/AppColors.dart';
import 'package:prokit_flutter/main/utils/AppWidget.dart';

import 'dart:convert'; // Para jsonDecode
import 'package:http/http.dart' as http;
import 'package:prokit_flutter/singleScreens/EmailVerificationScreen.dart';

import '../../main.dart';
import 'DTDrawerWidget.dart';

class DTSignUpScreen extends StatefulWidget {
  static String tag = '/DTSignUpScreen';

  @override
  DTSignUpScreenState createState() => DTSignUpScreenState();
}

class DTSignUpScreenState extends State<DTSignUpScreen> {
  
  bool obscureText = true;
  bool isLoading = false; // Bandera para mostrar el indicador de carga
  var emailCont = TextEditingController();
  var passCont = TextEditingController();
  var nameCont = TextEditingController();

  var emailFocus = FocusNode();
  var passFocus = FocusNode();

  // Clave global para el formulario
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Future<void> handleSignUp() async {
    // Validar el formulario antes de enviar
    if (_formKey.currentState?.validate() ?? false) {
      final name = nameCont.text.trim();
      final email = emailCont.text.trim();
      final password = passCont.text.trim();

      if (name.isEmpty || email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fill in all fields'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      setState(() {
        isLoading = true;
      });

      try {
        final response = await http.post(
          Uri.parse('https://back.dashboard.chatbot.mosquedacordova.com/api/register'),
          body: {
            'name': name,
            'email': email,
            'password': password,
            'password_confirmation': password,
          },
        );

        // Imprime la respuesta cruda del servidor
        debugPrint('Response status: ${response.statusCode}');
        debugPrint('Raw response: ${response.body}');

        if (response.statusCode == 201) {
          finish(context);

          // Redirige al usuario a la pantalla principal
          EmailVerificationScreen().launch(context, isNewTask: true);

        } else {
          // Maneja errores de respuesta
          final errorData = jsonDecode(response.body);

          String errorMessage = 'Registration failed, case: 1'; // Mensaje por defecto

          // Verifica si existen errores
          if (errorData['errors'] != null && errorData['errors'].isNotEmpty) {
            // Extraer el primer error
            var firstError = errorData['errors'].values.first[0];
            errorMessage = firstError;
          }

          // Mostrar el error en un SnackBar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        // Maneja cualquier excepción, como problemas de red o formato JSON
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed, case: 2'),
            backgroundColor: Colors.red,
          ),
        );
        //debugPrint('Error: $e');
        //toast('Unexpected error: $e');
      } finally {
        setState(() => isLoading = false);
      }
    }
  }


  @override
  void dispose() {
    nameCont.dispose();
    emailCont.dispose();
    passCont.dispose();
    super.dispose();
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
            child: Form(
              key: _formKey, // Usar la clave del formulario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Sign Up', style: boldTextStyle(size: 24)),
                  30.height,
                  TextFormField(
                    controller: nameCont,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Name',
                      contentPadding: EdgeInsets.all(16),
                      labelStyle: secondaryTextStyle(),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                      
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(emailFocus),
                    textInputAction: TextInputAction.next,
                  ),
                  16.height,

                  TextFormField(
                    controller: emailCont,
                    focusNode: emailFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: secondaryTextStyle(),
                      contentPadding: EdgeInsets.all(16),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appColorPrimary)),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: appStore.textSecondaryColor!)),
                      
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (s) => FocusScope.of(context).requestFocus(passFocus),
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction, // Activar validación al interactuar
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  20.height,
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(color: appColorPrimary, borderRadius: BorderRadius.circular(8), boxShadow: defaultBoxShadow()),
                    child: isLoading
                      ? CircularProgressIndicator(color: Colors.white) // Indicador de carga
                      : Text('Sign Up', style: boldTextStyle(color: white, size: 18)),
                  ).onTap(() {

                    if (!isLoading) handleSignUp(); // Evitar múltiples registros

                  }),
                  20.height,
                  Text('Already Registered?', style: boldTextStyle(color: appColorPrimary)).center().onTap(() {
                    finish(context);
                  }),
                ],
              ),
            ),
            
          ).center(),
        ),
      ),
    );
  }
}
