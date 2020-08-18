
import 'package:get_it/get_it.dart';
import 'package:simple_counter_cubit/bloc/counter_bloc.dart';

final getIt = GetIt.instance;

void setupAppConfig(){
getIt.registerSingleton<CounterBloc>(CounterBloc());
}