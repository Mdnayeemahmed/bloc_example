import 'package:equatable/equatable.dart';
import 'package:untitled5/ui/utils/enum.dart';

import '../../model/post_model.dart';

class PostsState extends Equatable {
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final PostStatus postStatus;
  final String msg;
  final String searchMsg;

  const PostsState(
      {this.postList = const <PostModel> [],
      this.postStatus = PostStatus.loading,
      this.msg = '',
      this.tempPostList = const <PostModel> [],
      this.searchMsg = ''});

  PostsState copyWith(
      {List<PostModel>? postList,
      PostStatus? postStatus,
      String? msg,
      List<PostModel>? tempPostList,
      String? searchMsg}) {
    return PostsState(
        postList: postList ?? this.postList,
        postStatus: postStatus ?? this.postStatus,
        msg: msg ?? this.msg,
        tempPostList: tempPostList ?? this.tempPostList,
        searchMsg: searchMsg ?? this.searchMsg);
  }

  @override
  List<Object> get props => [postList, postStatus, msg,tempPostList,searchMsg];
}
