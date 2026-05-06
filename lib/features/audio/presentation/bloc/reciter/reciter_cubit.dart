import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atheer/core/usecases/usecase.dart';
import 'package:atheer/features/audio/domain/entities/reciter.dart';
import 'package:atheer/features/audio/domain/usecases/get_reciters.dart';
import 'package:atheer/features/audio/presentation/bloc/reciter/reciter_state.dart';

class ReciterCubit extends Cubit<ReciterState> {
  final GetReciters getReciters;

  ReciterCubit({required this.getReciters}) : super(ReciterInitial());

  Future<void> loadReciters() async {
    emit(ReciterLoading());

    final result = await getReciters(const NoParams());

    result.fold(
      (failure) => emit(ReciterError(failure.message)),
      (reciters) => emit(ReciterLoaded(
        reciters: reciters,
        selectedReciter: reciters.isNotEmpty ? reciters.first : null,
      )),
    );
  }

  void selectReciter(Reciter reciter) {
    final currentState = state;
    if (currentState is ReciterLoaded) {
      emit(ReciterLoaded(
        reciters: currentState.reciters,
        selectedReciter: reciter,
      ));
    }
  }
}
