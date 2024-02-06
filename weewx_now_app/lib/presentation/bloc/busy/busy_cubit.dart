import 'package:bloc/bloc.dart';

class BusyCubit extends Cubit<bool> {
  BusyCubit() : super(false);

  void setBusy(bool busy) {
    emit(busy);
  }
}
