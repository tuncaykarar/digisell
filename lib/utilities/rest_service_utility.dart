import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'alert_util.dart';

class RestServiceUtility {
  static Future<bool> callRestPostService(
      {@required final context,
      @required final url,
      Map<String, String> headers,
      @required final jsonObject,
      @required Function afterSuccess}) {
    //necessary for BE content type, witout this BE rejetcs because of content type
    Map _headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    //TODO:fix below line
    // headers??_headers.addAll(headers);
    final _jsonObject = jsonObject;
    http.post(url, headers: _headers, body: _jsonObject).then((response) {
      _handleRestResponse(context, response, afterSuccess);
    }).catchError((error) {
      print(error);
    });
  }

  static _handleRestResponse(context, response, Function afterSuccess) {
    print('response: ' + response.body);
    if (response.statusCode == 200) {
      afterSuccess?.call(context, response);
    } else {
      _handleRestError(context, response);
    }
  }

  static _handleRestError(context, response) {
    var _message = 'Sorry an error occured...';
    if (response.statusCode == 500) {
      //TODO: get error from response
      //var _serverErrorMessage = response['error'];
      //_message = _serverErrorMessage ??= 'Sorry an error occured...';
      _message = 'Sorry an error occured...';
    }
    AlertUtil.showAlertDialog(context: context, message: _message);
    throw Exception(_message);
  }
}
