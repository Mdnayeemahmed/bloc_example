import 'package:equatable/equatable.dart';


abstract class SwitchExampleEvent{
  SwitchExampleEvent();
  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchExampleEvent{}

class SliderEvent extends SwitchExampleEvent{
  double slider;
  SliderEvent({required this.slider});

  @override
  List<Object> get props => [slider];
}
