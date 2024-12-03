import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc value) =>
            Text("Bloc Counter: ${value.state.transactionCount}")),
        actions: [
          IconButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterReset()),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc value) =>
            Text("Counter value: ${value.state.counter}")),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterIncreased(3)),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterIncreased(2)),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterBloc>().add(const CounterIncreased(1)),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
