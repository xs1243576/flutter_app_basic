// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import '../services/epoch_service.dart';
import '../ui/bottom_nav/favorites/favorites_viewmodel.dart';
import '../ui/bottom_nav/history/history_viewmodel.dart';
import '../services/information_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<EpochService>(() => EpochService());
  g.registerLazySingleton<InformationService>(() => InformationService());

  //Eager singletons must be registered in the right order
  g.registerSingleton<FavoritesViewModel>(FavoritesViewModel());
  g.registerSingleton<HistoryViewModel>(HistoryViewModel());
}
