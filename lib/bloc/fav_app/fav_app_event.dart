import 'package:equatable/equatable.dart';

import '../../model/fav_item_model.dart';

abstract class FavAppEvent extends Equatable{
  FavAppEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FetchFavouriteList extends FavAppEvent{}
class FavouriteItem extends FavAppEvent{
  final FavitemModel item;
  FavouriteItem({required this.item});
}
class SelectItem extends FavAppEvent{
  final FavitemModel item;
  SelectItem({required this.item});
}
class UnSelectItem extends FavAppEvent{
  final FavitemModel item;
  UnSelectItem({required this.item});
}
class deleteItem extends FavAppEvent{
}

