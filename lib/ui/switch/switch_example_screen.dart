import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_bloc.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_event.dart';
import 'package:untitled5/bloc/swicher_example/switch_example_state.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Example Two"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notification"),
                  BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                    buildWhen: (previous, current) =>
                        previous.isSwitch != current.isSwitch,
                    builder: (context, state) {
                      return Switch(
                          value: state.isSwitch,
                          onChanged: (newValue) {
                            context
                                .read<SwitchExampleBloc>()
                                .add(EnableOrDisableNotification());
                          });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                  buildWhen: (previous, current) =>
                      previous.sliderValue != current.sliderValue,
                  builder: (context, state) {
                    return Container(
                      height: 200,
                      color: Colors.red.withOpacity(state.sliderValue),
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              BlocBuilder<SwitchExampleBloc, SwitchExampleState>(
                  buildWhen: (previous, current) =>
                      previous.sliderValue != current.sliderValue,
                  builder: (context, state) {
                    return Slider(
                        value: state.sliderValue,
                        onChanged: (value) {
                          print(value);
                          context
                              .read<SwitchExampleBloc>()
                              .add(SliderEvent(slider: value));
                        });
                  }),
            ],
          )),
    );
  }
}
