import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/view/login/login_screen.dart';
import 'package:mini_social_app/view/sign_up/cubit/cubit.dart';
import 'package:mini_social_app/view/sign_up/cubit/states.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class SignUp extends StatelessWidget {
   SignUp({Key? key}) : super(key: key);
 final firsNameController = TextEditingController();
 final lastNameController = TextEditingController();
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
 final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> RegisterCubit(InitialRegisterState()),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener:(context,state){} ,
        builder:(context,state){
          RegisterCubit cubit = BlocProvider.of(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                iconTheme: const IconThemeData(
                  color: Colors.black,
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height:30,),
                        const Text('Sign up ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height:15,),
                        CustomTextFormField(
                          hint: 'first name',
                          controller: firsNameController,
                          type: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'first name is required' ;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height:10,),
                        CustomTextFormField(
                          hint: 'last name',
                          controller: lastNameController,
                          type: TextInputType.text,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'last name is required' ;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height:10,),
                        CustomTextFormField(
                          hint: 'Email',
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'email is required' ;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height:10,),
                        CustomTextFormField(
                          hint: 'Password',
                          controller:passwordController ,
                          type: TextInputType.visiblePassword,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'password is required' ;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height:15,),
                        CustomButton(
                          text: 'Sign Up ',
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              cubit.registerUser(
                                  firstName: firsNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                              ).then((value){
                                Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=>LoginScreen()),
                                );
                              });
                            }
                          },
                        ),
                        if(state is LoadingRegisterState)
                        const  Center(child: CircularProgressIndicator(color: Colors.black,)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } ,
      ),
    );
  }
}
