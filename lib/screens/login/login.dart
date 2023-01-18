import 'package:campus/data/constants.dart';
import 'package:campus/screens/login/login_provider.dart';
import 'package:campus/screens/login/validate.dart';
import 'package:campus/theme/app_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

class Login extends ConsumerStatefulWidget {
  static const String route = '/login';
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  var _passwordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  loginAction() async {
    final FormState form = _formKey.currentState!;
    if (form.validate()) {
      // // Provider.of<LoginProvider>(context, listen: false).login(
      //   context: context,
      //   email: emailController.text,
      //   password: passwordController.text,
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    var auth = ref.watch(authProvider);
    Validation validation = Validation(context: context);

    return Scaffold(
      body: ListView(
        // alignment: AlignmentDirectional.topCenter,
        children: [
          SizedBox(
            height: 32,
          ),
          Hero(
            tag: '111',
            child: SizedBox(
              width: 100,
              height: 100,
              // color: Colors.amber,
              child: Image.asset(
                'assets/images/logo.jpeg',
              ),
            ),
          ),
          Center(
            child: Text(
              'Campus',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor),
            ),
          ),
          // Column(
          //   children: [
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      //  child: SvgPicture.asset('assets/svg/logo.svg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: AutofillGroup(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'مرحبا ',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'اسم المستخدم',
                          style: TextStyle(
                            // fontFamily: 'Bahij TheSansArabic',
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          autofillHints: const [AutofillHints.email],
                          // validator: validation.email,
                          focusNode: emailFocusNode,

                          onTap: () {
                            FocusScope.of(context).requestFocus(emailFocusNode);

                            // FocusScope.of(context)
                            //     .requestFocus(new FocusNode());
                          },
                          keyboardType: TextInputType.text,
                          controller: emailController,

                          // },
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.perm_identity),
                            hintStyle: TextStyle(color: Colors.black),

                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            fillColor: Colors.white,
                            hintText: 'ادخل اسم المستخدم',
                            // labelText: 'اسم المستخدم',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'كلمة المرور',
                          style: TextStyle(
                            // fontFamily: 'Bahij TheSansArabic',
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          focusNode: passwordFocusNode,
                          autofillHints: const [AutofillHints.password],
                          // validator: validation.requiredField,
                          obscureText: _passwordVisible,
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);

                            // FocusScope.of(context)
                            //     .requestFocus(new FocusNode());
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.lock),
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 2.0),
                              borderRadius: BorderRadius.circular(12.0),
                            ),

                            hintText: 'ادخل كلمة المرور',
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                !_passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: kPrimaryColor,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0) +
                        MediaQuery.of(context).viewPadding,
                    child: ElevatedButton(
                      onPressed: () {
                        auth.whenOrNull(
                          initial: () => ref.read(authProvider.notifier).login(
                              context: context,
                              email: emailController.text,
                              password: passwordController.text),
                          loading: () => print('loading'),
                        );
                      },
                      // loginAction,
                      // onPressed: () => openLoadingDialog(context),
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),

                        height: 50,
                        // width: 200,
                        child: Center(
                            child: auth.whenOrNull(
                                        loading: () {
                                    return CircularProgressIndicator(
                                      color: Colors.white,
                                    );
                                  }, initial: () {
                                    return Text(
                                      'التسجيل',
                                      style: TextStyle(fontSize: 18),
                                    );
                        })),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // RichText(
                  //   text: TextSpan(
                  //     text: 'ليس لديكم حساب بعد ',
                  //     style: const TextStyle(
                  //         fontWeight: FontWeight.normal, color: Colors.black),
                  //     children: <TextSpan>[
                  //       TextSpan(
                  //         text: 'إنشاء حساب',
                  //         style: const TextStyle(
                  //             fontWeight: FontWeight.bold, color: Colors.blue),
                  //         recognizer: TapGestureRecognizer()
                  //           ..onTap = () {
                  //             FocusScope.of(context).unfocus();
                  //             emailController.clear();
                  //             passwordController.clear();
                  //             // hpush(context, SignUp());
                  //           },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Container(
          //       // color: Colors.black,
          //       width: getSize(context).width,
          //       height: 156,
          //       // child:
          //       // Image.asset('assets/images/rider.png', fit: BoxFit.cover),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
