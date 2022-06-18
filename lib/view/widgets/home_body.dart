import 'package:flutter/material.dart';
import 'package:realstate/models/realstate_model.dart';

class HomeBody extends StatelessWidget {
  final Datum home;

  const HomeBody({
    Key? key,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffF0F1F6),
          border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.07),
            ),
          ]),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                home.image,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "\$${home.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.home_outlined,
                      size: 17,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      "${home.city}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.bed,
                          size: 17,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${home.bedCount}",
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
                          size: 17,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${home.boll}",
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
                          size: 17,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          "${home.area}",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
