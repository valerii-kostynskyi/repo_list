import 'package:get/get.dart';

extension GetConnectExtension on GetConnect {
  Future<Response> getRequest({
    required String url,
    Map<String, dynamic>? query,
  }) {
    return get(
      url,
      query: query,
    ).then((value) {
      _logResponse(value);
      _handleBadStatus(value);
      return value;
    });
  }

  void _logResponse(Response response) {
    // ignore: avoid_print
    print(
        '${response.request?.method.toUpperCase()} ${response.request?.url} ${response.statusCode}\n${response.bodyString}');
  }

  void _handleBadStatus(Response response) {
    // switch (response.statusCode) {
    //   // no internet connection
    //   case null:
    //     {
    //       String errorMessage = response.statusText ?? 'Error';
    //       throw NetworkException(errorMessage);
    //     }
    //   // 401
    //   case HttpStatus.unauthorized:
    //     {
    //       Map json = jsonDecode(response.bodyString!);
    //       String errorMessage = json.parseJsonAsString(key: 'detail');
    //       throw UnAuthException(errorMessage);
    //     }
    //   // 400
    //   case HttpStatus.badRequest:
    //     {
    //       Map json = jsonDecode(response.bodyString!);
    //       Map<String, String?> result = {};

    //       json.forEach((key, value) {
    //         if (value == null) {
    //           result[key] = null;
    //         } else if (value is Iterable) {
    //           result[key] = value.join(', ');
    //         } else {
    //           result[key] = value.toString();
    //         }
    //       });

    //       throw ValidationException(result);
    //     }
    // }
  }
}
