import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/models/realstate_model.dart';
import 'package:realstate/view/widgets/housedetails_body.dart';

class HouseDetails extends StatelessWidget {
  final Datum homeDetails;
  const HouseDetails({Key? key, required this.homeDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            homeDetails.image,
            fit: BoxFit.fill,
            height: 440,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.7,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Color(0xffE3E6F1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Opacity(
                  opacity: 0.9,
                  child: Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xff3A413E),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Icon(
                          Icons.near_me_sharp,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "3D TOUR",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          HouseDetailsBody(homeDetails: homeDetails),
        ],
      ),
    );
  }
}
