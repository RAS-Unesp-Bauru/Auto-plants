import 'dart:async';
import 'package:influxdb_client/api.dart';

class API {
  List<List<dynamic>> tableData = [];

  var client = InfluxDBClient(
      url: 'https://us-east-1-1.aws.cloud2.influxdata.com',
      token:
      '0XFqyQKOrQ_tD8hJhKa3OlcdQHccNak7DKw8RmGifw83Tm9kGgAiPDyT8nEFxO9s2CqcWTJwjAvw95epXet-Tg==',
      org: '237cbd4c7d831bdf',
      bucket: 'ESP8266 Test',
      debug: true);

  Future<List<List<dynamic>>> getReq(id) async {
    var queryService = client.getQueryService();
    var fluxQuery = '''
      from(bucket: "ESP8266 Test")
          |> range(start: -30d)
          |> yield()''';

    var recordStream = await queryService.query(fluxQuery);
    await recordStream.forEach((record) {
      List<dynamic> aux = [];
      if (id == 1) {
        aux.add(record['_value']);
      }
      if (id == 2) {
        aux.add(record['_value']);
      }
      aux.add(record['_time']);
      tableData.add(aux);
    });

    client.close();
    return tableData;
    //await Future.delayed(Duration(seconds: 10));
  }
}
