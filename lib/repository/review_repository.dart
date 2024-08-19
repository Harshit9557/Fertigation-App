import 'dart:async';
import 'package:fertigation/data/network/network_api_services.dart';
import 'package:fertigation/models/review_item_model.dart';
import 'package:fertigation/utils/app_urls.dart';

class ReviewRepository {
  List<ReviewItemModel> simultaneousList = [];
  List<ReviewItemModel> sequentialList = [];

  Future<List<ReviewItemModel>> fetchSimultaneousItems() async {
    simultaneousList.clear();
    final response = await NetworkApiService().getApi(AppUrls.apiURL);
    simultaneousList = (response['simultaneous'] as List<dynamic>)
        .map((item) => ReviewItemModel.fromJson(item))
        .toList();
    return simultaneousList;
  }

  Future<List<ReviewItemModel>> fetchSequentialItems() async {
    sequentialList.clear();
    final response = await NetworkApiService().getApi(AppUrls.apiURL);
    sequentialList = (response['sequential'] as List<dynamic>)
        .map((item) => ReviewItemModel.fromJson(item))
        .toList();

    return sequentialList;
  }
}
