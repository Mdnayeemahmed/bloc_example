import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/posts/posts_bloc.dart';
import 'package:untitled5/bloc/posts/posts_state.dart';
import 'package:untitled5/ui/utils/enum.dart';

import '../../bloc/posts/posts_event.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostsBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return Center(child: CircularProgressIndicator());
            case PostStatus.success:
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search By Email',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: (filterKey) {
                        print(filterKey);
                        context.read<PostsBloc>().add(SearchByEmail(filterKey));
                      },
                    ),
                    Expanded(
                      child: state.searchMsg.isNotEmpty
                          ? Center(
                        child: Text(state.searchMsg),
                      )
                          : ListView.builder(
                        itemCount: state.tempPostList.isNotEmpty
                            ? state.tempPostList.length
                            : state.postList.length,
                        itemBuilder: (context, index) {
                          // Choose the appropriate list to display
                          final item = state.tempPostList.isNotEmpty
                              ? state.tempPostList[index]
                              : state.postList[index];

                          return ListTile(
                            title: Text(item.email!),
                            subtitle: Text(item.body!),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            case PostStatus.failure:
              return Center(child: Text(state.msg));
          }
        },
      ),
    );
  }
}
