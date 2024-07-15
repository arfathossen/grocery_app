import 'package:flutter/material.dart';
import 'package:grocery/constants.dart';
import 'package:grocery/models/plants.dart';

class DetailPage extends StatefulWidget {
  final int planetId;
  const DetailPage({super.key, required this.planetId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //toggle favorited button
  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

  //toggel and remove
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(0.15)),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Constants.primaryColor.withOpacity(0.15)),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          bool isFavorated = toggleIsFavorited(
                              plantList[widget.planetId].isFavorated);
                          plantList[widget.planetId].isFavorated = isFavorated;
                        });
                      },
                      icon: Icon(
                        plantList[widget.planetId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Container(
                width: size.width * .8,
                height: size.width * .8,
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 0,
                      child: SizedBox(
                        height: 350,
                        child: Image.asset(plantList[widget.planetId].imageURL),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            PlantFeature(
                              title: 'Size',
                              plantFeature: plantList[widget.planetId].size,
                            ),
                            PlantFeature(
                              title: 'Humidity',
                              plantFeature: plantList[widget.planetId]
                                  .humidity
                                  .toString(),
                            ),
                            PlantFeature(
                              title: 'Temperture',
                              plantFeature:
                                  plantList[widget.planetId].temperature,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plantList[widget.planetId].plantName,
                            style: TextStyle(
                                color: Constants.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            r's' + plantList[widget.planetId].price.toString(),
                            style: TextStyle(
                                color: Constants.blackColor,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            plantList[widget.planetId].rating.toString(),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Constants.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: Constants.primaryColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      plantList[widget.planetId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          height: 1.5,
                          fontSize: 18,
                          color: Constants.blackColor.withOpacity(.7)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 58,
        child: Row(
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: plantList[widget.planetId].isSelected == true
                            ? Constants.primaryColor.withOpacity(.3)
                            : Colors.white),
                  ],
                ),
                child: IconButton(
                  onPressed: () {
                    bool isSelected =
                        toggleIsSelected(plantList[widget.planetId].isSelected);
                    plantList[widget.planetId].isSelected = isSelected;
                  },
                  icon: Icon(Icons.shopping_cart,
                      color: plantList[widget.planetId].isSelected == true
                          ? Colors.white
                          : Constants.primaryColor),
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Constants.primaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Constants.primaryColor.withOpacity(.3)),
                ],
              ),
              child: const Center(
                  child: Text(
                'BUY NOW',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
              )),
            )),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  const PlantFeature(
      {super.key, required this.plantFeature, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Constants.blackColor),
        ),
        Text(
          plantFeature,
          style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
