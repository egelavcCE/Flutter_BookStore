import 'package:bookstore_flutter/Components/padding.dart';
import 'package:bookstore_flutter/Components/textfield.dart';
import 'package:bookstore_flutter/Sayfalar/best%20seller/bestsellerview.dart';
import 'package:bookstore_flutter/Sayfalar/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  final String token;
  const HomeView({super.key, required this.token});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  List<String> buttonContents = [
    "All",
    "Classics",
    "Horror",
    "Romance",
  ];
  int selectedButtonIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.h,
        backgroundColor: Colors.white,
        leadingWidth: 70.w,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: AppBarSizedBox(),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Center(
              child: Text('Catalog',
                  style: Theme.of(context).textTheme.headlineLarge),
            ),
          )
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          buttonContents.length,
                          (index) => Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedButtonIndex = index;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: selectedButtonIndex == index
                                    ? const Color(0xff6251DD)
                                    : const Color(0xffF4F4FF),
                                elevation: 0,
                              ),
                              child: Text(
                                buttonContents[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: selectedButtonIndex == index
                                          ? const Color(0xffFFFFFF)
                                          : const Color(0xff090937)
                                              .withOpacity(0.4),
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SearchFormField(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: categoryList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: ListViewPadding().listViewPadding,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(categoryList[index].name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BestSellerView(
                                                      token: widget.token,
                                                      contentList:
                                                          allContents[index],
                                                      title: categoryList[index]
                                                              .name ??
                                                          "",
                                                    )));
                                      },
                                      child: const Text(
                                        'View All',
                                        style:
                                            TextStyle(color: Color(0xffEF6B4A)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 140.h,
                                width: double.infinity,
                                child: ListView.builder(
                                  itemCount: allContents[index].length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return SizedBox(
                                      height: 140.h,
                                      width: 210.w,
                                      child: Card(
                                        elevation: 0,
                                        color: const Color(0xffF4F4FF),
                                        child: Row(
                                          children: [
                                            Image.network(allContents[index]
                                                        [index2]
                                                    .cover ??
                                                ""),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 10.h, bottom: 4.h),
                                                    child: Text(
                                                      allContents[index][index2]
                                                              .name ??
                                                          "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineMedium!
                                                          .copyWith(
                                                              fontSize: 12.sp),
                                                    ),
                                                  ),
                                                  Text(
                                                      allContents[index][index2]
                                                              .author ??
                                                          "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineSmall),
                                                  const Spacer(),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20.h),
                                                    child: Text(
                                                      allContents[index][index2]
                                                              .price
                                                              .toString() ??
                                                          "",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              fontSize: 16.sp),
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
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class AppBarSizedBox extends StatelessWidget {
  const AppBarSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      height: 32.h,
      child: SvgPicture.asset('assets/images/logo.svg'),
    );
  }
}
