import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled5/bloc/fav_app/fav_app_event.dart';
import 'package:untitled5/bloc/fav_app/fav_app_states.dart';
import 'package:untitled5/repo/fav_repo.dart';

import '../../model/fav_item_model.dart';



class FavAppBloc extends Bloc<FavAppEvent, FavAppStates> {

  List<FavitemModel> favList=[];
  List<FavitemModel> tempfavList=[];
  FavRepo favRepo;

  FavAppBloc(this.favRepo) : super(FavAppStates()) {
    on<FetchFavouriteList>(_fetchFavouriteList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnSelectItem>(_unSelectItem);
    on<deleteItem>(_deleteItem);

  }

  Future<void> _fetchFavouriteList(FetchFavouriteList event, Emitter<FavAppStates> emit) async {
    favList=await favRepo.fetch();


    emit(state.copyWith(favItemList: List.from(favList),listStatus: ListStatus.success));
  }
  Future<void> _selectItem(SelectItem event, Emitter<FavAppStates> emit) async {
    tempfavList.add(event.item);


    emit(state.copyWith(tempfavItemList: List.from(tempfavList)));
  }
  Future<void> _unSelectItem(UnSelectItem event, Emitter<FavAppStates> emit) async {
    tempfavList.remove(event.item);


    emit(state.copyWith(tempfavItemList: List.from(tempfavList)));
  }

  Future<void> _deleteItem(deleteItem event, Emitter<FavAppStates> emit) async {
    for(int i=0;i<tempfavList.length;i++){
      favList.remove(tempfavList[i]);
    }
    tempfavList.clear();



    emit(state.copyWith(
        favItemList: List.from(favList),

        tempfavItemList: List.from(tempfavList)));
  }



  Future<void> _addFavouriteItem(FavouriteItem event, Emitter<FavAppStates> emit) async {
    final index=favList.indexWhere((elements)=> elements.id==event.item.id);
    if(event.item.isFavourite){
      if(tempfavList.contains(favList[index])){
        tempfavList.remove(favList[index]);
        tempfavList.add(event.item);
      }
    }else{
      if(tempfavList.contains(favList[index])){
        tempfavList.remove(favList[index]);
        tempfavList.add(event.item);
      }
    }


    favList[index]=event.item;
    emit(state.copyWith(favItemList: List.from(favList),tempfavItemList: List.from(tempfavList)));

  }
}
