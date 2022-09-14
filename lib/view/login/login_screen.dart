
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/utils/constant.dart';
import 'package:mini_social_app/core/widgets/custom_text_form_field.dart';
import 'package:mini_social_app/view/home/home_screen.dart';
import 'package:mini_social_app/view/login/cubit/cubit.dart';
import 'package:mini_social_app/view/login/cubit/states.dart';
import 'package:mini_social_app/view/sign_up/sign_up.dart';
import '../../core/widgets/custom_button.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(InitialLoginState()),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener:(context,state){
          if(state is SuccessLoginState){
            token = state.loginModel!.token!;
          }
        } ,
        builder: (context,state){
          LoginCubit cubit = BlocProvider.of(context);
          return SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(
                        flex: 4,
                      ),
                      const Text('Sign in ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      CustomTextFormField(
                        hint: 'Email',
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        validate: (value){
                          if(value!.isEmpty) {
                            return 'the email is required' ;
                          }
                          return null;
                        },
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      CustomTextFormField(
                        hint: 'Password',
                        type: TextInputType.visiblePassword,
                        controller:passwordController ,
                        validate: (value){
                          if(value!.isEmpty) {
                            return 'the password is required' ;
                          }
                          return null;
                        },
                      ),
                      const  Spacer(
                        flex: 1,
                      ),
                      CustomButton(
                        text: 'Sign in ',
                        onPressed: (){
                        if(formKey.currentState!.validate()){
                          cubit.loginUser(
                              email:emailController.text,
                              password:passwordController.text,
                          ).then((value){
                            Navigator.pushReplacement(context,
                              MaterialPageRoute(builder:(context)=>const HomeScreen()),
                            );
                          });
                        }
                        },
                      ),
                      Row(
                        children: [
                          const Text('Don\'t have an account  ',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder:(context)=>SignUp()),
                              );
                            },
                            child:const Text('Sign Up',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if(state is LoadingLoginState)
                      const  Center(child: CircularProgressIndicator(color: Colors.black,)),
                      const Spacer(
                        flex: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
