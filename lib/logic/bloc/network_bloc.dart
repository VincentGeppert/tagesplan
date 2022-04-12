import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  StreamSubscription? _subscription;

  NetworkBloc() : super(NetworkInitial()) {
    on<NetworkEvent>((event, emit) {
      if (event is ListenConnection) {
        _subscription = DataConnectionChecker().onStatusChange.listen((status) {
          add(ConnectionChanged(status == DataConnectionStatus.disconnected
              ? NetworkFailure()
              : NetworkSuccess()));
        });
      }
      if (event is ConnectionChanged) {
        emit(event.connection);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
