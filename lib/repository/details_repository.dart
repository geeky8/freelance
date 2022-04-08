import 'dart:convert';

import 'package:freelance/models/details_model.dart';
import 'package:http/http.dart' as http;

class DetailRepository {
  final apiUrl = 'https://api.medrpha.com/api/product/getcategory';
  final imgUrl = ' https://superadmin.medrpha.com/allimage/';

  Future<List<DetailModel>> getDetails() async {
    final list = <DetailModel>[];
    final resp = await http.post(
      Uri.parse(apiUrl),
      body: {"sessid": "8bb82907b986c7fc"},
    );
    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      final dataList = data['data'] as List;
      for (final record in dataList) {
        final model =
            DetailModel.fromJson(json: record as Map<String, dynamic>);
        list.add(model);
      }
    } else {}

    return list;
  }
}
