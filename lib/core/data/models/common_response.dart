class CommonResponse<T> {
  int? statusCode;
  late String message;
  T? data;

  CommonResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (getStatus) {
      data = json['response'];
    } else {
      if (json['response']['message'].toString().isNotEmpty) {
        message = json['response']['message'];
      } else {
        switch (statusCode) {
          case 400:
            message = '400';
            break;
          case 401:
            message = '401';
            break;
          case 403:
            message = '403';
            break;
          case 404:
            message = '404';
            break;

          default:
            message = 'Something went wrong';
            break;
        }
      }
    }
  }

  // bool getStatus() {
  //   return statusCode.toString().startsWith('2');
  // }

  bool get getStatus => statusCode.toString().startsWith('2');
}
