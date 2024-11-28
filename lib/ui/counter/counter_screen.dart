import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/bloc/counter/counter_bloc.dart';
import 'package:untitled5/bloc/counter/counter_event.dart';
import 'package:untitled5/bloc/counter/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    // TODO: implement initState
    _counterBloc = CounterBloc();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Center(
                child: Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (current,previous) => false,
                    builder: (context, state) {

                  return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text("ADD"));
                }),
                SizedBox(
                  width: 10,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                    buildWhen: (current,previous) => false,

                    builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text("Decrement"));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
