import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/view_model/counter_view_model.dart';

class CounterPresenter extends StatefulWidget {
  const CounterPresenter({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<CounterPresenter> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CounterPresenter> {
  CounterViewModel counterViewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterViewModel>.value(
      value: counterViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CounterViewModel>(
                builder: (c, d, w) {
                  return Text(
                    '${d.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: counterViewModel.addCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
