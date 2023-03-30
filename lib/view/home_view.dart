import 'package:api_fetch_own/controller/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class MyHome extends StatelessWidget {
  MyHome({super.key});
  HomeViewControll homeViewControll = Get.put(HomeViewControll());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => homeViewControll.isloading.value
          ? const Center(child: CircularProgressIndicator())
          : _builScreen()),
    );
  }

  Widget _builScreen() {
    return ListView.builder(
        itemCount: homeViewControll.result?.data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(
                            homeViewControll.result!.data[index].avatar),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            homeViewControll.result!.data[index].firstName
                                .toUpperCase(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          Text(homeViewControll.result!.data[index].lastName,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 10)),
                          Text(homeViewControll.result!.data[index].email,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 10)),
                          Text(homeViewControll.result!.page.toString())
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
