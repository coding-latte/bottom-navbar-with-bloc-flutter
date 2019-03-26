import 'package:bloc/bloc.dart';
import 'package:bottom_navbar_with_bloc_flutter/state.dart';

enum NavbarItems { Red, Green, Blue }

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  @override
  NavbarState get initialState => ShowRed();

  @override
  Stream<NavbarState> mapEventToState(
      NavbarState state, NavbarItems event) async* {
    switch (event) {
      case NavbarItems.Blue:
        yield ShowBlue();
        break;
      case NavbarItems.Green:
        yield ShowGreen();
        break;
      default:
        yield ShowRed();
        break;
    }
  }
}
