import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/error.dart';
import '../../data/auth_repository.dart';

part 'check_phone_state.dart';

class CheckPhoneCubit extends Cubit<CheckPhoneState> {
  final AuthRepository authRepository;
  CheckPhoneCubit({required this.authRepository}) : super(CheckPhoneInitial());

  Future<void> fCheckPhone({required String phone}) async {
    emit(CheckPhoneLoadingState());
    final response = await authRepository.checkPhone(
      phone: phone,
    );
    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(CheckPhoneErrorState(message: failure.message));
        }
      },
      (success) {
        if (success == "User Not Found") {
          emit(CheckPhoneErrorState(message: success));
        } else if (success == "User Found") {
          emit(CheckPhoneSuccessState());
        }
      },
    );
  }
}
