import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_search_list/models/dog_model.dart';

class DogRepository {

  Future<List<DogModel>> fetchDogs(String query) async {
    final response = await http.get(
      Uri.parse("https://api.thedogapi.com/v1/breeds"),
    );
    var dogData = jsonDecode(response.body);
    List<DogModel> _dogList = [];
    List<DogModel> _searchedDogs = [];

    if (response.statusCode == 200 || response.statusCode == 201) {
      for (var dogItem in dogData) {
        DogModel _dogFullList = DogModel.fromJson(dogItem);
        _dogList.add(_dogFullList);
      }
      if (query.isEmpty) {
        return _dogList;
      } else {
        _searchedDogs = _dogList.where((dogModel) {
          return dogModel.name!.toLowerCase().contains(query.toLowerCase()) ||
            dogModel.bredFor.toString().toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
      return _searchedDogs;
    } else {
      return _dogList;
    }
  }
}
