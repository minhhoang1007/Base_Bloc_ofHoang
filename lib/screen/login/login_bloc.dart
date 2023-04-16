import 'dart:async';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc {
  var count = LoginState(0);

  // tạo 2 controller
  // 1 cái quản lý event, đảm nhận nhiệm vụ nhận event từ UI
  final eventController = StreamController<LoginEvent>();

  // 1 cái quản lý state, đảm nhận nhiệm vụ truyền state đến UI
  final stateController = StreamController<LoginState>();

  LoginBloc() {
    // lắng nghe khi eventController push event mới
    eventController.stream.listen((LoginEvent event) {
      // người ta thường tách hàm này ra 1 hàm riêng và đặt tên là: mapEventToState
      // đúng như cái tên, hàm này nhận event xử lý và cho ra output là state

      if (event is CounterIncrementPressed) {
        // nếu eventController vừa add vào 1 IncrementEvent thì chúng ta xử lý tăng âm lượng
        count = LoginState(count.numberGold + event.increment);
      } else if (event is CounterDecrementPressed) {
        // xử lý giảm âm lượng
        count = LoginState(count.numberGold - event.decrement);
      } else {
        count = LoginState(0);
      }

      // add state mới vào stateController để bên UI nhận được
      stateController.sink.add(count);
    });
  }

  // khi không cần thiết thì close tất cả controller
  void dispose() {
    stateController.close();
    eventController.close();
  }
}
