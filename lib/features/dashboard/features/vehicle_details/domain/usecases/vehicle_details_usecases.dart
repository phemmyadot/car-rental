import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/domain/api/vehicle_api.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';

class VehicleDetailsUsecase {
  VehicleAPI? get _vehicleAPI => Dependencies.resolve();
  GlobalRouter? get _router => Dependencies.resolve();

  void rentVehicle(Vehicle vehicle) async {
    final result = await _vehicleAPI?.rentVehicle(vehicle.uniqueIdentificator);
    result?.onSuccess((_) {
      _router?.showSnack('You successfully rent the choosen vehicle');
    }).catchError((exception) {
      _router?.showSnack(exception.toString());
    });
  }

  void releaseVehicle(Vehicle vehicle) async {
    final result =
        await _vehicleAPI?.releaseVehicle(vehicle.uniqueIdentificator);
    result?.onSuccess((_) {
      _router?.showSnack('You successfully release the choosen vehicle');
    }).catchError((exception) {
      _router?.showSnack(exception.toString());
    });
  }
}
