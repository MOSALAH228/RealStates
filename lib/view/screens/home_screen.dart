import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate/controllers/realstate_controllers.dart';
import 'package:realstate/view/screens/house_details.dart';
import 'package:realstate/view/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  final RealStateControllers realStateControllers =
      Get.put(RealStateControllers());
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF0F5),
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            child: Container(
              width: 120,
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xffD9DEF1),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(130)),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 90,
              height: 230,
              decoration: const BoxDecoration(
                color: Color(0xff255ED6),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40)),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const AppPar(),
                    const SizedBox(
                      height: 35,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color(0xffEFF0F5),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.white, width: 2.0),
                        ),
                        hintText: "Search Houses",
                        prefixIcon: const Icon(
                          Icons.home_outlined,
                          color: Colors.grey,
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(
                          Icons.mic_none,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: const <Widget>[
                        Text(
                          "Houses",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "in New York",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    body(realStateControllers: realStateControllers),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class body extends StatelessWidget {
  const body({
    Key? key,
    required this.realStateControllers,
  }) : super(key: key);

  final RealStateControllers realStateControllers;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (realStateControllers.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: realStateControllers.data.value.data.length,
          separatorBuilder: (c, x) => const SizedBox(
            height: 30,
          ),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(HouseDetails(
                  homeDetails: realStateControllers.data.value.data[index]));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:
                  HomeBody(home: realStateControllers.data.value.data[index]),
            ),
          ),
        );
      }
    });
  }
}

class AppPar extends StatelessWidget {
  const AppPar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Color(0xffE3E6F1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(
            Icons.zoom_in_map_rounded,
            color: Colors.grey,
          ),
        ),
        Opacity(
          opacity: 0.3,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xffE3E6F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.filter_list_rounded,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ],
    );
  }
}
