import 'package:base_bloc_hoang/screen/login/login_bloc.dart';
import 'package:base_bloc_hoang/screen/login/login_event.dart';
import 'package:base_bloc_hoang/screen/login/login_state.dart';
import 'package:base_bloc_hoang/screen/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bloc = LoginBloc();

  @override
  void dispose() {
    super.dispose();
    bloc.dispose(); // dispose bloc <=== new
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Bloc')),
      body: Center(
        child: StreamBuilder<LoginState>(
          stream: bloc.stateController.stream,
          initialData: bloc.count,
          builder: (BuildContext context, AsyncSnapshot<LoginState> snapshot) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 30.0,
                ),
                Text(
                  'He have ${snapshot.data?.numberGold} gold ball!',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  'Who are you?',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(snapshot.data?.numberGold == 5
                          ? "https://nqs.1cdn.vn/thumbs/600x315/2022/11/18/cristiano-ronaldo-portugal-wallpapers-1024x640.jpeg"
                          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqLzZKOKbYixMuIJNEwtplRQ8NzyYjrhz9hA&usqp=CAU")),
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Username'),
                  onChanged: (text) {
                    // do something with text
                  },
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Password'),
                  onChanged: (text) {
                    // do something with text
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.0,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amberAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    // context.read<LoginBloc>().add(ResultQuestion());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                  child: const Text('Login'),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              bloc.eventController.sink.add(CounterIncrementPressed(1));
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              bloc.eventController.sink.add(CounterDecrementPressed(1));
            },
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.restore),
            onPressed: () {
              bloc.eventController.sink.add(CounterResetPressed(0));
            },
          ),
        ],
      ),
    );
  }
}
