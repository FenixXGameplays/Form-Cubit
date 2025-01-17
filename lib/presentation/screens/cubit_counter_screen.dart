import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value){
          return Text("Cubit Counter ${value.state.transactionCount}");
        }),
        actions: [
          IconButton(
              onPressed: () => {counterCubit.reset()},
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text("Counter value: ${state.counter}");
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => counterCubit.increaseBy(3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () => counterCubit.increaseBy(2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () => counterCubit.increaseBy(1),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
