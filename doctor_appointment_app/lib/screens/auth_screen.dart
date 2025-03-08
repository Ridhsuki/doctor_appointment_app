import 'package:doctor_appointment_app/components/login_form.dart';
import 'package:doctor_appointment_app/components/register_form.dart';
import 'package:doctor_appointment_app/components/social_button.dart';
import 'package:doctor_appointment_app/utils/config.dart';
import 'package:doctor_appointment_app/utils/text.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Menjaga layout tetap fleksibel saat keyboard muncul
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppText.enText['welcome_text']!,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Text(
                  isSignIn
                      ? AppText.enText['signIn_text']!
                      : AppText.enText['register_text']!,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                isSignIn ? LoginForm() : RegisterForm(),
                Config.spaceSmall,
                isSignIn
                    ? Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            AppText.enText['forgot_password']!,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      )
                    : Container(),
                // Hilangkan Spacer() yang dapat menyebabkan overflow
                Center(
                  child: Text(
                    AppText.enText['social_login']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const <Widget>[
                    SocialButton(social: 'Google'),
                    SocialButton(social: 'Facebook'),
                  ],
                ),
                Config.spaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isSignIn
                          ? AppText.enText['signUp_text']!
                          : AppText.enText['registered_text']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isSignIn = !isSignIn;
                        });
                      },
                      child: Text(
                        isSignIn ? 'Sign Up': 'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:doctor_appointment_app/components/login_form.dart';
// import 'package:doctor_appointment_app/components/social_button.dart';
// import 'package:doctor_appointment_app/utils/config.dart';
// import 'package:doctor_appointment_app/utils/text.dart';
// import 'package:flutter/material.dart';

// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Config().init(context);
//     return Scaffold(
//       // resizeToAvoidBottomInset: true,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//         child: SafeArea(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               AppText.enText['welcome_text']!,
//               style: TextStyle(
//                 fontSize: 36,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Config.spaceSmall,
//             Text(
//               AppText.enText['signIn_text']!,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Config.spaceSmall,
//             LoginForm(),
//             Config.spaceSmall,
//             Center(
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   AppText.enText['forgot_password']!,
//                   style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//               ),
//             ),
//             // Social button Sign In
//             Spacer(),
//             Center(
//               child: Text(
//                 AppText.enText['social_login']!,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.normal,
//                   color: Colors.grey.shade500,
//                 ),
//               ),
//             ),
//             Config.spaceSmall,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: const <Widget>[
//                 SocialButton(social: 'Google'),
//                 SocialButton(social: 'Facebook'),
//               ],
//             ),
//             Config.spaceSmall,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   AppText.enText['signUp_text']!,
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.grey.shade500,
//                   ),
//                 ),
//                 const Text(
//                   ' Sign Up',
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                   ),
//                 )
//               ],
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
