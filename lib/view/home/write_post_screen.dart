import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/core/widgets/custom_text_form_field.dart';
import 'package:mini_social_app/view/home/cubit/home_cubit.dart';
import 'package:mini_social_app/view/home/cubit/home_states.dart';
import 'package:mini_social_app/view/home/home_screen.dart';

import '../../core/widgets/custom_button.dart';

class WritePostScreen extends StatelessWidget {
   WritePostScreen({Key? key}) : super(key: key);
    final textController = TextEditingController();
   final imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){
      },
      builder: (context,state){
        HomeCubit cubit = BlocProvider.of(context);
        return  SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: (){
                        cubit.addPost(
                          text: textController.text,
                          image: imageController.text,
                        ).then((value){
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>const HomeScreen()));
                        });
                      },
                      child: const Text('send',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children:const [
                      CircleAvatar(
                        radius:18,
                        backgroundImage: NetworkImage('https://th.bing.com/th/id/R.bcb7c8a35bc3eca543656ebef0305580?rik=DpD%2bCB3Q%2fjZjnQ&riu=http%3a%2f%2fsfwallpaper.com%2fimages%2fprofile-pics-3.jpg&ehk=BdnXRCnEoprQtrvoJlqyZYA%2f5kqZTVBD4Ddgd9JmWE0%3d&risl=&pid=ImgRaw&r=0'),
                      ),
                      SizedBox(width: 10,),
                      Text('Rokaia Ahmed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    hint: ' write what do you think ',
                    controller: textController,
                  ),
                  const SizedBox(height: 10,),
                  CustomTextFormField(
                    hint: 'enter url of image',
                    controller:imageController ,
                  ),
                  const SizedBox(height: 10,),
                  CustomButton(
                    onPressed: (){
                      cubit.addPost(
                        text: textController.text,
                        image: imageController.text,
                      ).then((value){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>const HomeScreen()));
                      });
                    },
                    text: 'send',
                  ),
                  if(state is LoadingPostState )
                  const Center(child:CircularProgressIndicator(),)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
