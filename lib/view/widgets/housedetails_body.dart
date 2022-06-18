import 'package:flutter/material.dart';
import 'package:realstate/models/realstate_model.dart';

class HouseDetailsBody extends StatelessWidget {
  const HouseDetailsBody({
    Key? key,
    required this.homeDetails,
  }) : super(key: key);

  final Datum homeDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 365,
          decoration: const BoxDecoration(
            color: Color(0xffEFF0F5),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Head(homeDetails: homeDetails),
                const SizedBox(
                  height: 15,
                ),
                Body(homeDetails: homeDetails),
                const SizedBox(
                  height: 13,
                ),
                Footer(homeDetails: homeDetails),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.homeDetails,
  }) : super(key: key);

  final Datum homeDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "\$${homeDetails.price}",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        Container(
          width: 180,
          height: 38,
          decoration: BoxDecoration(
            color: Color(0xff1358E9),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(
            child: Text(
              "BOOK A HOUSE",
              style: TextStyle(
                  letterSpacing: 2, color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.homeDetails,
  }) : super(key: key);

  final Datum homeDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffF4F6FB),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.04),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        homeDetails.image,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Alyssa Watson",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "OWNER",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xffE3E6F1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.phone_enabled,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Custom- build kitchenes feature white oak and charcoal gray cabinetry, honoed Basalinta and Frigidaire cooktops.",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Head extends StatelessWidget {
  const Head({
    Key? key,
    required this.homeDetails,
  }) : super(key: key);

  final Datum homeDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${homeDetails.city}",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Detail Oriented House",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const SizedBox(
          height: 15,
        ),
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Icon(
                  Icons.bed,
                  size: 22,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "${homeDetails.bedCount}",
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.bathtub_rounded,
                  size: 22,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "${homeDetails.boll}",
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: <Widget>[
                const Icon(
                  Icons.window_outlined,
                  size: 22,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  "${homeDetails.area}",
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
