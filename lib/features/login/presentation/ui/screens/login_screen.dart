import 'package:ecommerce_app/core/enitity/user_entity.dart';
import 'package:ecommerce_app/features/login/presentation/bloc/signin/signin_bloc.dart';
import 'package:ecommerce_app/features/category/presentation/ui/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginForm = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SigninBloc, SignInState>(
        listener: (context, state) {
          if (state is SuccessSignInState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged In Successfully")));
          } else if (state is ErrorSignInState) {
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
                    height: 250,
                    child: Image.asset("assets/images/test_image.png")),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const Text("Username"),
                TextFormField(controller: usernameController),
                const Text("Password"),
                TextFormField(
                  controller: passController,
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
                        context.read<SigninBloc>().add(SigninUserEvent(
                            user: UserEntity(
                                password: passController.text,
                                username: usernameController.text.trim())));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => const CategoryScreen(),
                        //     ));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => CategoryScreen(),
                        //     ));
                      },
                      child: state is LoadingSignInState
                          ? const CircularProgressIndicator(
                              strokeWidth: 2,
                            )
                          : const Text("Sign in"),
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ? "),
                    Text("Sign Up"),
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
