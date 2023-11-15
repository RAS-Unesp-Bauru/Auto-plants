import 'dart:async';
import 'package:influxdb_client/api.dart';

class API {
  List<List<dynamic>> tableData = [];
  // List<dynamic> temperature = [];
  // List<dynamic> humidity = [];
  // List<dynamic> time = [];
  var client = InfluxDBClient(
      url: 'https://us-east-1-1.aws.cloud2.influxdata.com',
      token: '0XFqyQKOrQ_tD8hJhKa3OlcdQHccNak7DKw8RmGifw83Tm9kGgAiPDyT8nEFxO9s2CqcWTJwjAvw95epXet-Tg==',
      org: '237cbd4c7d831bdf',
      bucket: 'ESP8266 Test',
      debug: true);

  Future<List<List<dynamic>>> getReq(field) async {

    var queryService = client.getQueryService();
    var fluxQuery = '''
      from(bucket: "ESP8266 Test")
          |> range(start: -10d)
          |> filter(fn: (r) => r["_field"] == "$field")
          |> yield()''';

    var recordStream = await queryService.query(fluxQuery);
    await recordStream.forEach((record) {
      List<dynamic> aux = [];
      if (record['_field'] == 'temperature') {
        aux.add(record['_value']);
      }
      if (record['_field'] == 'humidity') {
        aux.add(record['_value']);
      }
      aux.add(record['_time']);
      tableData.add(aux);
    });
  print(tableData);
    // for(int i = 0; i < temperature.length; i++) {
    //   List<dynamic> aux = [];
    //   aux.add(temperature[i]);
    //   aux.add(humidity[i]);
    //   aux.add(time[i]);
    //   tableData.add(aux);
    // }
    client.close();
    return tableData;
    //await Future.delayed(Duration(seconds: 10));
  }
}
