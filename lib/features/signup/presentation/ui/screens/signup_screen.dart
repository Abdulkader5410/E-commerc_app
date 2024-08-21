import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/signin/signin_bloc.dart';
import 'package:ecommerce_app/features/login/presentation/ui/screens/login_screen.dart';
import 'package:ecommerce_app/features/signup/presentation/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> loginForm = GlobalKey();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SuccessSignUpState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Registered Successfully")));
          } else if (state is ErrorSignUpState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          print("STATE $state");
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const SizedBox(height: 10),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: 200,
                    child: Image.asset("assets/images/test_image.png")),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const Text("First Name"),
                TextFormField(controller: fnameController),
                const Text("Last Name"),
                TextFormField(
                  controller: lnameController,
                ),
                const Text("Email"),
                TextFormField(controller: emailController),
                const Text("Username"),
                TextFormField(
                  controller: usernameController,
                ),
                const Text("Password"),
                TextFormField(controller: passController),
                const Text("Gender"),
                TextFormField(
                  controller: genderController,
                ),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forget Password",
                    )),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width / 1.5,
                    child: MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      color: Colors.redAccent,
                      onPressed: () {
                        // context.read<UserCubit>().signIn();
                        context.read<SignUpBloc>().add(SignUpUserEvent(
                            user: UserEntity(
                                email: emailController.text,
                                firstName: fnameController.text,
                                lastName: lnameController.text,
                                gender: genderController.text,
                                password: passController.text,
                                username: usernameController.text.trim())));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const CategoryScreen(),
                        //     ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: state is LoadingSignInState
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                            )
                          : const Text("Sign Up"),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Registered ? "),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text("Sign In")),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }
}
