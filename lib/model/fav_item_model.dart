import 'package:equatable/equatable.dart';

class FavitemModel extends Equatable{
  FavitemModel(
      {required this.id,
        required this.value,this.isDeleting=false,this.isFavourite=false

      }
      );

  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  FavitemModel copyWith({String? id,String? value,bool? isDeleting,bool? isFavourite}){
    return FavitemModel(
      id: id??this.id,
      value: value??this.value,
      isDeleting: isDeleting??this.isDeleting,
      isFavourite: isFavourite??this.isFavourite,
    );

  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,value,isDeleting,isFavourite];
}