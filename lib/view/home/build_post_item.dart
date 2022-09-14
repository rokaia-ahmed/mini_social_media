import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_social_app/view/home/cubit/home_cubit.dart';
import 'package:buildcondition/buildcondition.dart';
import 'package:mini_social_app/view/home/cubit/home_states.dart';
import '../../model/get_data_model.dart';

class BuildPost extends StatelessWidget {
    const BuildPost( {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        HomeCubit cubit = BlocProvider.of(context);
        return Flexible(
          child: BuildCondition(
            condition:(cubit.data.isNotEmpty) ,
            builder:(context)=> ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context,index)=> BuildItem(cubit.data[index],),
                separatorBuilder:(context,index)=>const Divider(
                  color: Colors.grey,
                ) ,
                itemCount:cubit.data.length ),
            fallback:(context)=>const Center(child: CircularProgressIndicator()) ,
          ),
        );
      } ,
    );
  }
}
class BuildItem extends StatelessWidget {
 final DataModel ? model ;
   const BuildItem(this.model,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              const  CircleAvatar(
                radius:18,
                backgroundImage: NetworkImage('https://th.bing.com/th/id/R.bcb7c8a35bc3eca543656ebef0305580?rik=DpD%2bCB3Q%2fjZjnQ&riu=http%3a%2f%2fsfwallpaper.com%2fimages%2fprofile-pics-3.jpg&ehk=BdnXRCnEoprQtrvoJlqyZYA%2f5kqZTVBD4Ddgd9JmWE0%3d&risl=&pid=ImgRaw&r=0'),
              ),
             const SizedBox(width: 10,),
              Text( model!.name!.length>10? model!.name!.substring(0,10):model!.name!,
                style:const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                Text('${model!.content}'),
                const SizedBox(height: 5,),
                if(model!.image!.contains('http'))
                Image.network(model!.image!),
              ],
            ),
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed:(){},
                        color: Colors.red,
                        icon:const Icon(Icons.favorite),
                      ),
                      const Text('14',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ) ,
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed:(){},
                        color: Colors.red,
                        icon:const Icon(Icons.chat_bubble),
                      ),
                      const Text('37',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      ) ,
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15,),
              Expanded(
                child: Container(
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed:(){},
                        color: Colors.red,
                        icon: const Icon(Icons.share),
                      ),
                      const Text('3',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ) ,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
