import 'package:flutter/material.dart';
import 'package:mini_project/widgets/home_widgets/emergencies/policeemergency.dart';
import 'package:mini_project/widgets/home_widgets/emergencies/FirebrigadeEmergency.dart';
import 'package:mini_project/widgets/home_widgets/emergencies/AmbulanceEmergency.dart';


class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          PoliceEmergency(),
          FamilyMember(),
          AmbulanceEmergency(),
        ],
      ),
    );
  }
}
