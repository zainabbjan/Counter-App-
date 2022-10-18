import 'package:constcolor/ui/screen/homepage/view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
        create: (BuildContext context) {
          return HomeViewModel();



        },
        child: Consumer<HomeViewModel>(
            builder: (context, model, child) => Scaffold(
                  backgroundColor: model.backgroundColor,
                  appBar: AppBar(
                    title: Text(title),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have pushed the button this many times:',
                        ),
                        Text(
                          model.count.toString(),
                          style: Theme.of(context).textTheme.headline4,
                        )
                      ],
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: (() {
                      model.incrementCounter();
                    }),
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                )));
  }
}
