import 'package:car_rental_app/common/design_system/design_system.dart';
import 'package:car_rental_app/domain/models/vehicle.dart';
import 'package:car_rental_app/features/dashboard/features/vehicle_details/presentation/cubit/vehicle_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VehicleDetailsScreenArguments {
  final Vehicle vehicle;
  final bool isMy;

  VehicleDetailsScreenArguments(this.vehicle, this.isMy);
}

class VehicleDetailsScreen extends StatelessWidget {
  final VehicleDetailsScreenArguments arguments;
  late final VehicleDetailsCubit cubit;
  VehicleDetailsScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key) {
    cubit = VehicleDetailsCubit(arguments.vehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F8F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: DSBackButton(),
        title: Text(
          arguments.vehicle.name,
          style: DSTextStyles.poppins.copyWith(
            fontSize: 18.relative,
            fontWeight: FontWeight.w600,
            color: DSColors.GREY_700,
          ),
        ),
      ),
      body: StreamBuilder<VehicleDetailsState>(
          stream: cubit.stream,
          initialData: cubit.state,
          builder: (context, snapshot) {
            final state = snapshot.data!;
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: 24.relative,
                    ),
                    ..._imageWidgets(state),
                    _separator,
                    ..._infoBloc(),
                    _separator,
                    ..._carSpecifications(),
                    SizedBox(
                      height: 100.relative,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 24.relative,
                      right: 24.relative,
                      bottom:
                          24.relative + MediaQuery.of(context).padding.bottom),
                  child: DSPrimaryButton(
                      title:
                          arguments.isMy ? 'Release this car' : 'Rent this car',
                      action: () {
                        arguments.isMy
                            ? cubit.release(arguments.vehicle)
                            : cubit.rent(arguments.vehicle);
                      }),
                ),
              ],
            );
          }),
    );
  }

  final titles = [
    'MAKE',
    'MODEL',
    'YEAR',
    'MILEAGE',
    'TRANSMISSION',
    'COLOR',
    'No OF DOORS',
  ];
  Widget _speceficationCard(int index) => Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(16.relative),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles[index],
                      style: DSTextStyles.poppins.copyWith(
                        fontSize: 12.relative,
                        color: DSColors.GREY_500,
                      ),
                    ),
                    if (titles[index] == 'COLOR')
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            color: HexColor.fromHex(
                              arguments.vehicle.speceficationFor(
                                titles[index],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(3.relative)),
                      )
                    else
                      Container(
                        width: 120,
                        child: Text(
                          arguments.vehicle.speceficationFor(titles[index]),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: DSTextStyles.gilroy.copyWith(
                              fontSize: 15.relative,
                              color: DSColors.GREY_900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          margin: EdgeInsets.all(3),
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.relative),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3),
            ],
          ),
        ),
      );

  List<Widget> _carSpecifications() => [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.relative),
          child: Text(
            'Car Specifications',
            style: DSTextStyles.gilroy.copyWith(
                fontSize: 22.relative,
                color: DSColors.BRAND_BLACK,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 25.relative,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.relative),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            childAspectRatio: 1.9,
            crossAxisSpacing: 26.relative,
            mainAxisSpacing: 26.relative,
            crossAxisCount: 2,
            children: List.generate(7, _speceficationCard),
          ),
        ),
        SizedBox(
          height: 25.relative,
        ),
      ];

  Widget get _separator => Padding(
        padding: EdgeInsets.symmetric(vertical: 20.relative),
        child: Container(
          height: 1,
          color: DSColors.SEPARATOR_LIGHT,
        ),
      );
  List<Widget> _infoBloc() => [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.relative),
          child: Container(
            height: 25.relative,
            child: Text(
              arguments.vehicle.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: DSTextStyles.gilroy.copyWith(
                fontSize: 24.relative,
                color: DSColors.BRAND_BLACK,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.relative),
          child: Container(
            height: 25.relative,
            child: RichText(
              maxLines: 1,
              text: TextSpan(
                  text: '\$' + arguments.vehicle.price.toStringAsFixed(0),
                  style: DSTextStyles.gilroy.copyWith(
                    fontSize: 20.relative,
                    color: DSColors.GREEN_600,
                    fontWeight: FontWeight.w900,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: DSTextStyles.poppins.copyWith(
                        fontSize: 14.relative,
                        color: DSColors.GREY_1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
        )
      ];

  List<Widget> _imageWidgets(VehicleDetailsState state) => [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.relative),
          child:
              Container(height: 250, child: _networkImage(state.selectedImage)),
        ),
        SizedBox(
          height: 20.relative,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.relative),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                arguments.vehicle.images.length,
                (index) => GestureDetector(
                  onTap: () {
                    cubit.imageSelected(arguments.vehicle.images[index]);
                  },
                  child: Container(
                    width: 66.relative,
                    height: 66.relative,
                    child: _networkImage(
                      arguments.vehicle.images[index],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ];

  Widget _networkImage(String link) => ClipRRect(
        borderRadius: BorderRadius.circular(10.relative),
        child: Image(
          fit: BoxFit.cover,
          image: NetworkImage(link),
        ),
      );
}
