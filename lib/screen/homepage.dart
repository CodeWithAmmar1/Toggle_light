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
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        title: Text(
          'Light Switch',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BlocBuilder<LightBloc, LightState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: state.isOn ? Colors.yellow.withValues(alpha:  0.2) : Colors.transparent,
        blurRadius: 20,
        spreadRadius: 5,
        offset: Offset(0, 5),
      ),
    ],
  ),
  child: Icon(
    state.isOn ? Icons.lightbulb : Icons.lightbulb_outline,
    size: 150,
    color: state.isOn ? Colors.yellow : Colors.grey,
  ),
),

                SizedBox(height: 20),
                Text(
                  state.isOn ? 'Light is ON' : 'Light is OFF',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    lightBloc.add(ToggleLightEvent());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Colors.indigoAccent.withValues(alpha: 0.5),
                  ),
                  child: Text(
                    'Toggle Light',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
