import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import '../controller/new_controller.dart';
import '../data/provider.dart';
import '../repository/repository.dart';
import 'no_internet.dart';

class HomeView extends GetView<HomeController> {
  HomeController controller =
      Get.put(HomeController(ShowRepository(ApiProvider())));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D3AA9),
          title: const Text('Series List'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.add_alert_rounded),
              onPressed: () {
                Get.isDarkMode
                    ? Get.changeTheme(ThemeData.light())
                    : Get.changeTheme(ThemeData.dark());
              },
            )
          ],
        ),
        body: controller.obx(
          (state) => ListView.separated(
              padding: const EdgeInsets.only(top: 8),
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  color: Colors.grey,
                );
              },
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 150,
                    height: 150,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: state[index].imageThumbnailPath!,
                      placeholder: (context, url) => const Center(
                        child: SkeletonAvatar(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state[index].name!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state[index].startDate!.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        state[index].network!,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          RatingBar(
                            itemSize: 15,
                            initialRating: 3,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: const Icon(Icons.star),
                              empty: const Icon(Icons.star_border),
                              half: const Icon(Icons.star),
                            ),
                            itemPadding:
                             const EdgeInsets.symmetric(horizontal: 0),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  subtitle: Text(
                    state[index].country!,
                    style: const TextStyle(fontSize: 14),
                  ),
                  trailing: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.orange,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Download",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state!.length),
          onLoading: SkeletonListView(),
          onError: (error) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: EmptyFailureNoInternetView(
              image: 'lottie/failure_lottie.json',
              title: 'Error',
              description: error.toString(),
              buttonText: "Retry",
              onPressed: () {
                controller.getTvShow();
              },
            ),
          ),
          onEmpty: EmptyFailureNoInternetView(
            image: 'lottie/empty_lottie.json',
            title: 'Content unavailable',
            description: 'Content not found',
            buttonText: "Retry",
            onPressed: () {
              controller.getTvShow();
            },
          ),
        ));
  }
}
