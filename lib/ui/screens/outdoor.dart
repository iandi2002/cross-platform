import 'package:flutter/material.dart';
import 'package:flutter_onboarding/constants.dart';
import 'package:flutter_onboarding/models/plants.dart';

import 'package:flutter_onboarding/models/poutdoor.dart';
import 'package:flutter_onboarding/ui/screens/detail_page.dart';
import 'package:flutter_onboarding/ui/screens/widgets/plant_widget.dart';
import 'package:page_transition/page_transition.dart';

class OutdoorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<POutdoor> _polantList = POutdoor.polantList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Outdoor Plants'),
      ),
      body: GridView.builder(
        itemCount: _polantList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.75, // Ширина квадратного блока к его высоте
        ),
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: DetailPage(
                    plantId: _polantList[index].plantId,
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: Container(
              width: size.width *
                  0.4, // Ширина контейнера с учетом размещения по два в ряд
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(_polantList[index].imageURL),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _polantList[index].category,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          _polantList[index].plantName,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          r'$' + _polantList[index].price.toString(),
                          style: TextStyle(
                            color: Constants.primaryColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
