


import 'package:equatable/equatable.dart';
import 'package:untitled5/ui/utils/enum.dart';

import '../../model/post_model.dart';

class PostsState extends Equatable {
  final List<PostModel> postList;
  final PostStatus postStatus;
  final String msg;

  const PostsState({this.postList = const [],this.postStatus=PostStatus.loading,this.msg=''});

  PostsState copyWith({List<PostModel>? postList,PostStatus? postStatus,String? msg}) {
    return PostsState(postList: postList ?? this.postList,postStatus: postStatus??this.postStatus,msg:msg??this.msg);
  }

  @override
  List<Object> get props => [postList,postStatus,msg];
}

