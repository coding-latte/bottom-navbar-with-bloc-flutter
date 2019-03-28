import 'package:bottom_navbar_with_bloc_flutter/bloc.dart';
import 'package:bottom_navbar_with_bloc_flutter/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NavbarBloc _navbarBloc;

  @override
  void initState() {
    super.initState();
    _navbarBloc = NavbarBloc();
  }

  @override
  void dispose() {
    _navbarBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navbarBloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is ShowBlue)
          return buildHomepage(state.title, Colors.blue, state.itemIndex);
        if (state is ShowGreen)
          return buildHomepage(state.title, Colors.green, state.itemIndex);
        if (state is ShowRed)
          return buildHomepage(state.title, Colors.red, state.itemIndex);
      },
    );
  }

  Scaffold buildHomepage(String title, Color color, int currentIndex) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: color,
        child: Center(
          child: Text(title),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) _navbarBloc.dispatch(NavbarItems.Red);
          if (index == 1) _navbarBloc.dispatch(NavbarItems.Blue);
          if (index == 2) _navbarBloc.dispatch(NavbarItems.Green);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            title: Text("Red"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            title: Text("Blue"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            title: Text("Green"),
          )
        ],
      ),
    );
  }
}
