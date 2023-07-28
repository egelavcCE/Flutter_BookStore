import 'package:bookstore_flutter/Sayfalar/home/category_model.dart';
import 'package:bookstore_flutter/Sayfalar/home/category_service.dart';
import 'package:bookstore_flutter/Sayfalar/home/homeview.dart';
import 'package:bookstore_flutter/contents_model.dart';
import 'package:bookstore_flutter/project_dio.dart';
import 'package:flutter/material.dart';

abstract class HomeViewModel extends State<HomeView> with ProjectDioMixin {
  late final ICategoryService categoryService;

  HomeViewModel() {
    categoryService = CategoryService(service);
  }

  List<CategoryModel> categoryList = [];
  List<ContentModel> contentList = [];
  List<List<ContentModel>> allContents = [];

  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }


  @override
  void initState() async {
    super.initState();
    await getList();
  }

  Future<void> getList() async {
    changeLoading();
    categoryList = await categoryService.getCategories() ?? [];
    await getListContent(categoryList.length);
    changeLoading();
  }

  Future<void> getListContent(int count) async {
    allContents = List.generate(count, (index) => []);
    for (var i = 0; i < count; i++) {
      allContents[i] = await categoryService.getContents(i) ?? [];
      await getListProduct(allContents[i]);
    }
  }

  Future<void> getListProduct(List<ContentModel> productImage) async {
    await Future.forEach(productImage, (element) async {
      element.cover =
          await categoryService.getProductImage(cover: element.cover ?? "");
      productImage.firstWhere((element2) => element.id == element2.id).cover =
          element.cover;
    });
  }
}
