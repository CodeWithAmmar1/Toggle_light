import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/light_bloc.dart';
import '../bloc/light_event.dart';
import '../bloc/light_state.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final lightBloc = BlocProvider.of<LightBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('BLoC Light Switch')),
      body: Center(
        child: BlocBuilder<LightBloc, LightState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  state.isOn ? Icons.lightbulb : Icons.lightbulb_outline,
                  size: 100,
                  color: state.isOn ? Colors.yellow : Colors.grey,
                ),
                SizedBox(height: 20),
                Text(
                  state.isOn ? 'Light is ON' : 'Light is OFF',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    lightBloc.add(ToggleLightEvent());
                  },
                  child: Text('Toggle Light'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
