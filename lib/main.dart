
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_counter_cubit/bloc/counter_bloc.dart';

import 'di/app_config.dart';
void main() {
  setupAppConfig();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context)=>getIt<CounterBloc>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'tab1',
              child: Icon(Icons.add),
              onPressed: ()=>context.bloc<CounterBloc>().increment()),
          SizedBox(width: 20,),
          FloatingActionButton(
              heroTag: 'tab2',
              child: Icon(Icons.remove),
              onPressed: ()=>context.bloc<CounterBloc>().decrement()),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc,int>(
            builder: (context,count){
             return Center(child: Text('$count'));
            },
          ),
        ],
      ),
    );
  }
}


