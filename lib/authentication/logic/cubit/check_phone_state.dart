part of 'check_phone_cubit.dart';

sealed class CheckPhoneState extends Equatable {
  const CheckPhoneState();

  @override
  List<Object> get props => [];
}

final class CheckPhoneInitial extends CheckPhoneState {}

final class CheckPhoneErrorState extends CheckPhoneState {
  final String message;
  const CheckPhoneErrorState({required this.message});
}

final class CheckPhoneLoadingState extends CheckPhoneState {}

final class CheckPhoneSuccessState extends CheckPhoneState {}