// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:qommsion/authentication/data/location_model.dart';
// import 'package:qommsion/authentication/data/location_repository.dart';
// import 'package:qommsion/constants/errors.dart';

// import '../../../injection_container.dart';
// import 'auth_cubit.dart';

// part 'location_state.dart';

// class LocationCubit extends Cubit<LocationState> {
//   final LocationRepository locationRepository;
//   LocationCubit({required this.locationRepository}) : super(LocationInitial());
//   String? governmentId = sl<AuthCubit>().appRepository.loadAppData() == null
//       ? null
//       : sl<AuthCubit>().appRepository.loadAppData()!.governorateId;
//   String? areaId = sl<AuthCubit>().appRepository.loadAppData() == null
//       ? null
//       : sl<AuthCubit>().appRepository.loadAppData()!.areaId;
//   List<Re> location = [];
//   Future<void> fLocation() async {
//     emit(LocationLoadingState());
//     final response = await locationRepository.governatesAndAreas();
//     response.fold((failure) {
//       if (failure is ServerFailure) {
//         emit(LocationErrorState(message: failure.message));
//       }
//     }, (success) {
//       log(success.res.toString());
//       location = success.res;
//       emit(LocationSuccessState(location: success.res));
//     });
//   }
// }
