import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/helpers/result_type.dart';
import 'package:car_rental_app/common/services/firebase%20_helper.dart';
import 'package:car_rental_app/common/services/session_service.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';

class AccountException implements Exception {
  @override
  String toString() => 'You must to have account to rent a car';
}

class VehicleAPI {
  static FirebaseHelper? get _helper => Dependencies.resolve();
  static SessionService? get _session => Dependencies.resolve();

  Future<Stream<List<Vehicle>>?> getDataStream() async {
    final data = _helper?.vehicles.snapshots().map(
        (event) => event.docs.map((e) => Vehicle.fromJSON(e.data())).toList());
    return data;
  }

  Future<List<Vehicle>> getAll() async {
    final shot = await _helper?.vehicles.get();
    return shot?.docs.map((e) => Vehicle.fromJSON(e.data())).toList() ?? [];
  }

  Future<ResultType<void>> rentVehicle(String vehicleID) async {
    final userId = _session?.currentUser?.uniqueId;
    if (userId == null) return ResultType.failure(AccountException());
    final user = _helper?.users.doc(userId);
    final _user = _session!.currentUser!..rentedCars.add(vehicleID);
    await user?.set(_user.toJSON());
    await _helper?.vehicles.doc(vehicleID).update({'available': false});
    return ResultType.success(() {});
  }

  Future<ResultType<void>> releaseVehicle(String vehicleID) async {
    final userId = _session?.currentUser?.uniqueId;
    if (userId == null) return ResultType.failure(AccountException());
    final user = _helper?.users.doc(userId);
    final _user = _session!.currentUser!..rentedCars.remove(vehicleID);
    await user?.set(_user.toJSON());
    await _helper?.vehicles.doc(vehicleID).update({'available': true});
    return ResultType.success(() {});
  }

  Future<ResultType<List<Vehicle>>> getMyVehicles() async {
    final cars = _session?.currentUser?.rentedCars ?? [];
    if (cars.isEmpty) return ResultType.success([]);
    final vehicles = await _helper?.vehicles
        .where('uniqueIdentificator',
            whereIn: _session?.currentUser?.rentedCars ?? [])
        .get();
    return ResultType.success(
        vehicles?.docs.map((e) => Vehicle.fromJSON(e.data())).toList() ?? []);
  }
}
