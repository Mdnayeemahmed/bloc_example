
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent{
  final String todoTask;

  const AddTodoEvent({
    required this.todoTask
});


  @override
  // TODO: implement props
  List<Object?> get props => [todoTask];

}


class RemoveTodoEvent extends TodoEvent{
  final Object task;

  const RemoveTodoEvent({
    required this.task
  });



  @override
  List<Object?> get props => [task];

}
