import 'package:equatable/equatable.dart';
import 'package:untitled5/model/fav_item_model.dart';

enum ListStatus { loading, success, failure }

class FavAppStates extends Equatable {
  final List<FavitemModel> favItemList;
  final List<FavitemModel> tempfavItemList;

  final ListStatus listStatus;

  FavAppStates(
      {this.favItemList = const [],this.tempfavItemList = const [], this.listStatus = ListStatus.loading});

  FavAppStates copyWith({List<FavitemModel>? favItemList,ListStatus? listStatus,List<FavitemModel>? tempfavItemList}){
    return FavAppStates(
    favItemList: favItemList??this.favItemList,
      listStatus: listStatus??this.listStatus,
      tempfavItemList: tempfavItemList??this.tempfavItemList,
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [favItemList,listStatus,tempfavItemList];
}
