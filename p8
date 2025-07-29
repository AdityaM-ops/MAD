import 'package:flutter/material.dart';

void main() => runApp(Myapp());
class Myapp extends StatelessWidget{
Widget build(BuildContext context){
return MaterialApp(home:ToggleMessage());
}
}

class ToggleMessage extends StatefulWidget {
  @override
  _ToggleMessageState createState() => _ToggleMessageState();
}

class _ToggleMessageState extends State<ToggleMessage> {
  bool showHello = true;
  void toggle() => setState(() => showHello = !showHello);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Toggle")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(showHello ? "Adi" : "M", style: TextStyle(fontSize: 30)),
          ElevatedButton(onPressed: toggle, child: Text("Toggle")),
        ],
      ),
    ),
  );
}
