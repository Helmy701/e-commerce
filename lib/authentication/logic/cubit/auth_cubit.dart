import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../constants/app_data/app_data.dart';
import '../../../constants/app_data/repo.dart';
import '../../../constants/error.dart';
import '../../data/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository, required this.appRepository})
      : super(AuthInitial());

  final AuthRepository authRepository;
  final AppRepository appRepository;

  Future<void> fLogin({required String phone, required String password}) async {
    emit(LoginLoadingState());
    final response =
        await authRepository.login(phone: phone, password: password);
    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(LoginErrorState(message: failure.message));
        } else {
          emit(LoginErrorState(message: failure.toString()));
        }
      },
      (success) {
        appRepository.store.setAppData(AppData(
          token: success.token,
          id: success.user.id.toString(),
          name: success.user.name,
          code: success.user.code.toString(),
          cashback: success.user.cashback.toString(),
          areaId: success.user.areaId.toString(),
          governorateId: success.user.governorateId.toString(),
          countCodeUsed: success.user.countCodeUsed.toString(),
          status: success.user.status.toString(),
          phone: success.user.phone.toString(),
        ));
        emit(LoginSuccessState());
      },
    );
  }

  Future<void> fRegister({
    required String name,
    required String phone,
    required String password,
    required String governorate,
    required String area,
  }) async {
    emit(RegisterLoadingState());
    final response = await authRepository.register(
        name: name,
        phone: phone,
        password: password,
        governorate: governorate,
        area: area);
    response.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(RegisterErrorState(message: failure.message));
        }
      },
      (success) {
        appRepository.store.setAppData(AppData(
          token: success.token,
          id: success.user.id.toString(),
          name: success.user.name,
          code: success.user.code.toString(),
          areaId: success.user.areaId.toString(),
          governorateId: success.user.governorateId.toString(),
          status: success.user.status.toString(),
          phone: success.user.phone.toString(),
        ));
        emit(RegisterSuccessState());
      },
    );
  }
}
