part of 'counter_bloc.dart';

class CounterBlocState extends Equatable {
  const CounterBlocState({this.counter = 10, this.transactionCount = 0});

  final int counter;
  final int transactionCount;

  CounterBlocState copyWith({
    int? counter,
    int? transactionCount,
  }) => CounterBlocState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );
  
  @override
  List<Object> get props => [counter, transactionCount];
}

 