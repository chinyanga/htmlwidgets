import 'dart:async';

import 'package:htmlwidgets/ui/tradingwidgets/economic_calendar.dart';
import 'package:htmlwidgets/ui/tradingwidgets/mini_chart.dart';
import 'package:htmlwidgets/ui/tradingwidgets/single_ticker.dart';

import '../core/screens.dart';
import 'base_bloc.dart';

class MainLayoutBloC implements BaseBloC {
  final _selectedScreenState = StreamController<Screens>();
  Screens currentScreen = Screens.EconomicCalendar;

  Stream<Screens> get selectedScreenStateStream => _selectedScreenState.stream;

  void onTapSetSelectedScreen(Screens screen) {
    _selectedScreenState.sink.add(screen);
    currentScreen = screen;
  }

  selectedScreen(activeScreen, mainLayoutBloC) {
    switch (activeScreen) {
      case Screens.EconomicCalendar:
        return EconomicCalendar();
      case Screens.MiniChart:
        return MiniChart();
      case Screens.SingleTicker:
        return SingleTicker();
      default:
        return EconomicCalendar();
    }
  }

  @override
  void dispose() {
    _selectedScreenState.close();
  }
}