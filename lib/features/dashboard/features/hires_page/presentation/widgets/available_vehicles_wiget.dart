import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/common/di/dependency_injection.dart';
import 'package:car_rental_app/common/routing/routing.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';
import 'package:car_rental_app/features/dashboard/features/hires_page/presentation/cubit/hires_page_cubit.dart';
import 'package:car_rental_app/features/dashboard/features/home_page/presentation/cubit/home_page_cubit.dart';
import 'package:car_rental_app/features/dashboard/features/vehicle_details/presentation/pages/vehicle_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvailableVehiclesWidget extends StatelessWidget {
  final List<Vehicle> vehicles;
  final HiresPageCubit cubit;
  AvailableVehiclesWidget({
    Key? key,
    required this.vehicles,
    required this.cubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.relative),
      child: ListView.builder(
          itemCount: vehicles.length, itemBuilder: _listBuilder),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    final vehicle = vehicles[index];
    return GestureDetector(
      onTap: () async {
        await Dependencies.resolve<GlobalRouter>()?.pushNamed(
            NamedRoutes.VEHICLE_DETAILS_SCREEN,
            arguments: VehicleDetailsScreenArguments(vehicle, true));
        cubit.load();
      },
      child: Container(
        height: 140.relative,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _image(vehicle),
                SizedBox(
                  width: 20.relative,
                ),
                _information(context, vehicle),
                DSIcons.arrowRightIcon,
              ],
            ),
            SizedBox(
              height: 20.relative,
            ),
            Container(
              height: 1,
              color: DSColors.SEPARATOR.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  Column _information(BuildContext context, Vehicle vehicle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 25,
          width: MediaQuery.of(context).size.width - 200.relative,
          child: Text(
            vehicle.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: DSTextStyles.gilroy.copyWith(
              fontSize: 20.relative,
              color: DSColors.BRAND_BLACK,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 25,
          width: MediaQuery.of(context).size.width - 200.relative,
          child: Text(
            vehicle.description,
            maxLines: 1,
            style: DSTextStyles.poppins.copyWith(
              fontSize: 14.relative,
              color: DSColors.BRAND_BLACK,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 25,
          width: MediaQuery.of(context).size.width - 200.relative,
          child: RichText(
            maxLines: 1,
            text: TextSpan(
                text: '\$' + vehicle.price.toStringAsFixed(0),
                style: DSTextStyles.gilroy.copyWith(
                  fontSize: 20.relative,
                  color: DSColors.GREEN_600,
                  fontWeight: FontWeight.w900,
                ),
                children: [
                  TextSpan(
                    text: ' / month',
                    style: DSTextStyles.poppins.copyWith(
                      fontSize: 12.relative,
                      color: DSColors.GREY_1,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }

  SizedBox _image(Vehicle vehicle) {
    return SizedBox(
      width: 107.relative,
      height: 93.relative,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.relative),
        child: Image(
          image: NetworkImage(vehicle.image),
          fit: BoxFit.cover,
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: DSLoader(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }
}

class DSLoader extends StatelessWidget {
  final double? value;

  const DSLoader({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        strokeWidth: 2.relative,
        value: value,
        color: DSColors.GREEN_600,
      );
}
