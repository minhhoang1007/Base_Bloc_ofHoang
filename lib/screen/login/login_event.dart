abstract class LoginEvent {}

/// Notifies bloc to increment state.
class CounterIncrementPressed extends LoginEvent {
  CounterIncrementPressed(this.increment);

  final int increment;
}

/// Notifies bloc to decrement state.
class CounterDecrementPressed extends LoginEvent {
  CounterDecrementPressed(this.decrement);

  final int decrement;
}

class CounterResetPressed extends LoginEvent {
  CounterResetPressed(this.value);

  final int value;
}

class ResultQuestion extends LoginEvent {
  ResultQuestion(this.isShow);

  final bool isShow;
}
