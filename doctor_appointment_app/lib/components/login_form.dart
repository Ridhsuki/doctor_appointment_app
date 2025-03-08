import 'package:doctor_appointment_app/components/button.dart';
import 'package:doctor_appointment_app/main.dart';
import 'package:doctor_appointment_app/model/auth_model.dart';
import 'package:doctor_appointment_app/provider/dio_provider.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor),
          ),
          Config.spaceSmall,
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obsecurePass,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obsecurePass = !obsecurePass;
                      });
                    },
                    icon: obsecurePass
                        ? const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_outlined,
                            color: Config.primaryColor,
                          )),
                prefixIconColor: Config.primaryColor),
          ),
          Config.spaceSmall,
          Consumer<AuthModel>(
            builder: (context, auth, child) {
              return Button(
                width: double.infinity,
                title: 'Sign In',
                onpressed: () async {
                  bool isSuccess = await DioProvider()
                      .getToken(_emailController.text, _passController.text);

                  if (isSuccess) {
                    auth.loginSuccess();
                    print("Login sukses, berpindah halaman...");
                    if (MyApp.navigatorKey.currentState != null) {
                      MyApp.navigatorKey.currentState!.pushNamed('main');
                    } else {
                      print(
                          "navigatorKey tidak ditemukan, cek konfigurasi MyApp!");
                    }
                  } else {
                    print("Login gagal, email atau password salah.");
                  }
                },

                // onpressed: () async {
                //   // final token = await DioProvider()
                //   //     .getToken(_emailController.text, _passController.text);
                //   bool isSuccess = await DioProvider()
                //       .getToken(_emailController.text, _passController.text);
                //   if (isSuccess) {
                //     // ✅ Perbaikan: Gunakan boolean dengan jelas
                //     auth.loginSuccess();
                //     if (MyApp.navigatorKey.currentState != null) {
                //       MyApp.navigatorKey.currentState!.pushNamed('main');
                //     }
                //   } else {
                //     print("Login gagal, periksa kembali email dan password.");
                //   }
                // },
                disable: false,
              );
            },
          )
        ],
      ),
    );
  }
}

// I/appointment_app(17407): Compiler allocated 5417KB to compile void android.view.ViewRootImpl.performTraversals()
// E/libEGL  (17407): called unimplemented OpenGL ES API
// I/Choreographer(17407): Skipped 179 frames!  The application may be doing too much work on its main thread.
// E/libEGL  (17407): called unimplemented OpenGL ES API
