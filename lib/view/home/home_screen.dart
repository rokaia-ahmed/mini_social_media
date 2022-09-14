import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/view/home/cubit/home_cubit.dart';
import 'package:mini_social_app/view/home/cubit/home_states.dart';
import 'package:mini_social_app/view/home/write_post_screen.dart';
import 'package:mini_social_app/view/login/login_screen.dart';
import 'build_post_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,states){},
      builder: (context,states){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Facebook',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: (){},
                  icon: const Icon(Icons.search),
                iconSize: 28,
                color:Colors.red ,
              ),
            ],
          ),
          drawer: Drawer(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                 const SizedBox(height:34,),
                  const CircleAvatar(
                    radius:60,
                    backgroundImage: NetworkImage('https://th.bing.com/th/id/R.bcb7c8a35bc3eca543656ebef0305580?rik=DpD%2bCB3Q%2fjZjnQ&riu=http%3a%2f%2fsfwallpaper.com%2fimages%2fprofile-pics-3.jpg&ehk=BdnXRCnEoprQtrvoJlqyZYA%2f5kqZTVBD4Ddgd9JmWE0%3d&risl=&pid=ImgRaw&r=0'),
                  ),
                  const SizedBox(height: 10,),
                  const Text('Rokaia Ahmed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height:20,),
                  ListTile(
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()));
                    } ,
                    title: const Text('Sign out',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                      ),
                    ),
                    leading:const Icon(Icons.logout,
                    size: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body:Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                 Row(
                   children: [
                   const  CircleAvatar(
                       radius: 25,
                       backgroundImage: NetworkImage('https://th.bing.com/th/id/R.bcb7c8a35bc3eca543656ebef0305580?rik=DpD%2bCB3Q%2fjZjnQ&riu=http%3a%2f%2fsfwallpaper.com%2fimages%2fprofile-pics-3.jpg&ehk=BdnXRCnEoprQtrvoJlqyZYA%2f5kqZTVBD4Ddgd9JmWE0%3d&risl=&pid=ImgRaw&r=0'),
                     ),
                     const SizedBox(width: 10,),
                     Expanded(
                       child: GestureDetector(
                         onTap:(){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder:(context)=>WritePostScreen()),
                           );
                         },
                         child: Container(
                           height: 45,
                           decoration: BoxDecoration(
                             color: Colors.grey.withOpacity(.5),
                             borderRadius: BorderRadius.circular(30),
                           ),
                           child:const Center(
                             child:  Text('write what do you think',
                                style: TextStyle(),
                             ),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
                const SizedBox(height: 30,),
                const BuildPost(),
              ],
            ),
          ) ,
        );
      },
    );
  }
}
