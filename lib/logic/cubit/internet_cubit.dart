import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:tagesplan/data/dataproviders/network_service.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();

  InternetCubit() : super(InternetInitial()) {
    connectionStatus.connectionChange.listen((event) {
      if (event.hasConnection) {
        emitInternetConnected();
      } else {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected() => emit(InternetConnected());

  void emitInternetDisconnected() => emit(InternetDisconnected());
}
