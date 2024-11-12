import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/fav_app/fav_app_bloc.dart';
import 'package:untitled5/bloc/fav_app/fav_app_event.dart';
import 'package:untitled5/bloc/fav_app/fav_app_states.dart';
import 'package:untitled5/model/fav_item_model.dart';

class FavAppScreen extends StatefulWidget {
  const FavAppScreen({super.key});

  @override
  State<FavAppScreen> createState() => _FavAppScreenState();
}

class _FavAppScreenState extends State<FavAppScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    context.read<FavAppBloc>().add(FetchFavouriteList());
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          BlocBuilder<FavAppBloc,FavAppStates>(builder: (context,state){return            Visibility(
            visible: state.tempfavItemList.isNotEmpty?true:false,
            child: IconButton(onPressed: (){

              context.read<FavAppBloc>().add(deleteItem());
            }, icon: Icon(Icons.delete)),
          );
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavAppBloc,FavAppStates>(builder: (context,state){
          switch(state.listStatus){
            case ListStatus.loading:
              return Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return Center(child: Text("Failed"),);
            case ListStatus.success:
              return ListView.builder(itemCount: state.favItemList.length,itemBuilder: (context,index){
                final item=state.favItemList[index];
                return Card(
                  child: ListTile(
                    title: Text(
                      item.value,
                      style: state.tempfavItemList.contains(item)
                          ? TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      )
                          : TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),

                    leading: Checkbox(value: state.tempfavItemList.contains(item)?true:false, onChanged: (value){
                      if(value!){
                        context.read<FavAppBloc>().add(SelectItem(item: item));
                      }else{
                        context.read<FavAppBloc>().add(UnSelectItem(item: item));

                      }

                    }),
                    trailing: IconButton(onPressed: (){
                      FavitemModel itemModel=FavitemModel(id: item.id, value: item.value,isFavourite: item.isFavourite?false:true);


                      context.read<FavAppBloc>().add(FavouriteItem(item: itemModel));
                    }, icon: item.isFavourite? Icon(Icons.favorite): Icon(Icons.favorite_border)),
                  ),
                );
              });
          }
        }),
      ),
    );
  }
}
