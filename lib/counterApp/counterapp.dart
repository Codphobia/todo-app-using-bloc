import 'package:bloc_todo/counterApp/bloc/counter_bloc_bloc.dart';
import 'package:bloc_todo/counterApp/bloc/counter_bloc_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: BlocBuilder<CounterBloc, CounterBlocState>(
        builder: (context, state) {
          return Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FloatingActionButton(
                        heroTag: '0',
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(IncrementCounterEvent());
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.add),
                      ),
                      FloatingActionButton(
                        heroTag: '1',
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(DecrementCounterEvent());
                        },
                        tooltip: 'Decrement',
                        child: const Icon(Icons.minimize),
                      ),
                      FloatingActionButton(
                        heroTag: '2',
                        onPressed: () {
                          BlocProvider.of<CounterBloc>(context)
                              .add(ResetCounterEvent());
                        },
                        tooltip: 'Reset',
                        child: const Icon(Icons.exposure_zero),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
