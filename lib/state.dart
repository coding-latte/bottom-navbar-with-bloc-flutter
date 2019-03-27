abstract class NavbarState {}

class ShowRed extends NavbarState {
  final String title = "Red";
  final int selectNavbarIndex = 0;
}

class ShowBlue extends NavbarState {
  final String title = "Blue";
  final int selectNavbarIndex = 1;
}

class ShowGreen extends NavbarState {
  final String title = "Green";
  final int selectNavbarIndex = 2;
}
