import 'package:untitled5/model/fav_item_model.dart';

class FavRepo {
  Future<List<FavitemModel>> fetch() async {
    await Future.delayed(Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavitemModel> _generateList(int length) {
    return List.generate(length,
        (index) => FavitemModel(id: index.toString(), value: "Items $index"));
  }
}
