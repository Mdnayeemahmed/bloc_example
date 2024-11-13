import 'package:bloc/bloc.dart';
import 'package:untitled5/bloc/posts/posts_event.dart';
import 'package:untitled5/bloc/posts/posts_state.dart';
import 'package:untitled5/repo/post_repo.dart';
import 'package:untitled5/ui/utils/enum.dart';



class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostRepo postRepo=PostRepo();


  PostsBloc() : super(PostsState()) {
    on<FetchPost>(_fetchPost);
  }

  void _fetchPost(PostsEvent event, Emitter<PostsState> emit) async {
    await postRepo.fetchPost().then((value){
     emit(state.copyWith(postStatus: PostStatus.success,msg: "success",postList: value));


    }).onError((error,stackTracer){
      emit(state.copyWith(postStatus: PostStatus.failure,msg: error.toString()));

    });


  }

}
