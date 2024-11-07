import 'package:equatable/equatable.dart';

class SwitchExampleState extends Equatable {
  final bool isSwitch;
  final double sliderValue;

  SwitchExampleState({this.isSwitch = false, this.sliderValue = 1.0});

  SwitchExampleState copyWith({bool? isSwitch, double? sliderValue}) {
    return SwitchExampleState(
        isSwitch: isSwitch ?? this.isSwitch,
        sliderValue: sliderValue ?? this.sliderValue);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [isSwitch, sliderValue];
}
