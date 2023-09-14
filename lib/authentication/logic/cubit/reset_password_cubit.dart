import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/error.dart';
import '../../data/auth_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository authRepository;
  ResetPasswordCubit({required this.authRepository})
      : super(ResetPasswordInitial());

  Future<void> fResetPassword(
      {required String phone,
      required String password,
      required String confirmPassword}) async {
    emit(ResetPasswordLoadingState());
    final response = await authRepository.resetPassword(
        phone: phone, password: password, confirmPassword: confirmPassword);
    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(ResetPasswordErrorState(message: failure.message));
        }
      },
      (success) {
        emit(ResetPasswordSuccessState());
      },
    );
  }
}
