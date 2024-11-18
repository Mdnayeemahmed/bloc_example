
import 'package:equatable/equatable.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();
  List<Object?> get props => [];

}

class FetchPost extends PostsEvent{
  const FetchPost();

}

class SearchByEmail extends PostsEvent{
  final String searchByEmail;
  const SearchByEmail(this.searchByEmail);

}

