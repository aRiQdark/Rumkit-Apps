import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rumkit_covid/models/model.dart';

class rumkitcontroller extends GetxController {
  Future<List<datarumkit>> getdata() async {
    Uri parse = Uri.parse("https://dekontaminasi.com/api/id/covid19/hospitals");
    var tes = await http.get(parse);
    print(tes.body);

    List<dynamic> jsondata = (jsonDecode(tes.body));
    print(jsondata);

    return jsondata.map((e) => datarumkit.fromJson(e)).toList();
  }
}
