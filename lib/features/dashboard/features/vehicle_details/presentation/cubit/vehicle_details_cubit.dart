import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';
import 'package:car_rental_app/features/dashboard/features/vehicle_details/domain/usecases/vehicle_details_usecases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vehicle_details_state.dart';

class VehicleDetailsCubit extends Cubit<VehicleDetailsState> {
  VehicleDetailsUsecase? get _usecase => Dependencies.resolve();
  VehicleDetailsCubit(Vehicle vehicle)
      : super(VehicleDetailsState(vehicle.image));

  void imageSelected(String link) {
    emit(VehicleDetailsState(link));
  }

  void rent(Vehicle vehicle) {
    _usecase?.rentVehicle(vehicle);
  }

  void release(Vehicle vehicle) {
    _usecase?.releaseVehicle(vehicle);
  }
}
