import 'package:flutter/widgets.dart';
import 'package:grocery/constants.dart';
import 'package:grocery/models/plants.dart';
import 'package:grocery/views/screens/detail_page.dart';
import 'package:page_transition/page_transition.dart';

class PlanetWidget extends StatelessWidget {
  const PlanetWidget({
    super.key,
    required this.index,
    required this.plantList,
  });

  final int index;
  final List<Plant> plantList;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                child: DetailPage(
                  planetId: plantList[index].plantId,
                ),
                type: PageTransitionType.bottomToTop));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Constants.primaryColor.withOpacity(.1),
            borderRadius: BorderRadius.circular(18)),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Constants.primaryColor.withOpacity(.8),
                      shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.8,
                    child: Image.asset(plantList[index].imageURL),
                  ),
                ),
                Positioned(
                    bottom: 5,
                    left: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantList[index].category),
                        Text(
                          plantList[index].plantName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Constants.blackColor),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                r's' + plantList[index].price.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Constants.primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
