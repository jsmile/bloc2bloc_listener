import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/color/color_bloc.dart';
import 'blocs/counter/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
          BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        ],
        child: MaterialApp(
          title: 'BLoC to BLoC by BlocListener Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // useMaterial3: true,
          ),
          home: const MyHomePage(
              title: 'Flutter BLoC to BLoC by BolcListener Home Page'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          incrementSize = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text(
                  'Change Color',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  context.read<ColorBloc>().add(ColorChangedEvent());
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                '${context.watch<CounterBloc>().state.count}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 52.0,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text(
                  'Change Counter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                onPressed: () {
                  context
                      .read<CounterBloc>()
                      .add(CounterChangedEvent(incrementSize: incrementSize));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
