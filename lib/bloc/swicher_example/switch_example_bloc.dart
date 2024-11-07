import 'package:bloc/bloc.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_event.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_state.dart';

class SwitchExampleBloc extends Bloc<SwitchExampleEvent, SwitchExampleState> {
  SwitchExampleBloc() : super(SwitchExampleState()) {
    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(
      EnableOrDisableNotification event, Emitter<SwitchExampleState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }



  void _slider(
      SliderEvent event, Emitter<SwitchExampleState> emit) {
    emit(state.copyWith(sliderValue: event.slider));
  }
}
