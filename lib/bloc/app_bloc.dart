import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../resources/app_repository.dart';


part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final _repository = AppRepository();
  AppBloc() : super(AppInitial()) {
    on<LocaleInitAppEvent>(_repository.onLocaleInitAppEvent);
    on<AppStartedEvent>(_repository.onAppStartedEvent);
    on<UserAuthedAppEvent>(_repository.onUserAuthedAppEvent);
  }
}

