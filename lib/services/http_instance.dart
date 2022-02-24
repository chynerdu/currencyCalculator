import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpInstance {
  HttpInstance._();

  static final instance = HttpInstance._();

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    "charset": "utf-8",
  };

  Future getData({required String path}) async {
    try {
      Future<http.Response> apiResponse =
          http.get(Uri.parse(path), headers: headers);
      http.Response response = await apiResponse;

      var decodedData = jsonDecode(response.body);

      if (response.statusCode < 200 || response.statusCode > 299) {
        var decodedData = jsonDecode(response.body);
        throw decodedData;
      }
      return decodedData;
    } on SocketException catch (_) {
      throw 'Kindly, check your internet connection.';
    } on TimeoutException catch (_) {
      throw 'Request Timeout.';
    } on FormatException catch (_) {
      throw 'Error Occured.';
    } catch (e) {
      throw 'error occured';
    }
  }
}
