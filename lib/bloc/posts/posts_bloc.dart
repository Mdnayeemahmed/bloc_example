import 'package:bloc/bloc.dart';
import 'package:untitled5/bloc/posts/posts_event.dart';
import 'package:untitled5/bloc/posts/posts_state.dart';
import 'package:untitled5/repo/post_repo.dart';
import 'package:untitled5/ui/utils/enum.dart';

import '../../model/post_model.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  List<PostModel> tempPostList = [];

  PostRepo postRepo = PostRepo();

  PostsBloc() : super(PostsState()) {
    on<FetchPost>(_fetchPost);
    on<SearchByEmail>(_searchByEmail);
  }

  void _fetchPost(FetchPost event, Emitter<PostsState> emit) async {
    await postRepo.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, msg: "success", postList: value));
    }).onError((error, stackTracer) {
      emit(state.copyWith(
          postStatus: PostStatus.failure, msg: error.toString()));
    });
  }

  void _searchByEmail(SearchByEmail event, Emitter<PostsState> emit) async {
    if (event.searchByEmail.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMsg: ''));
    } else {
      tempPostList = state.postList
          .where((element) => element.email
              .toString()
              .toLowerCase()
              .contains(event.searchByEmail.toLowerCase()))
          .toList();

      if (tempPostList.isEmpty) {
        print("empty");
        emit(
            state.copyWith(tempPostList: tempPostList, searchMsg: 'No Data Found'));
      } else {
        print("no empty");

        emit(state.copyWith(tempPostList: tempPostList, searchMsg: ''));
      }
    }
  }
}
