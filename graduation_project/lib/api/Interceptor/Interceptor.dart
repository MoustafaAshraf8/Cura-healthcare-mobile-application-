class Interceptor {
  late String _baseUrl;
  late Object _data;
  late Duration connectTimeOut;
  late Duration sendTimeOut;
  late Duration receiveTimeOut;
  late Map<String, dynamic> headers;
  late String method;

  void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  void setData(Object data) {
    _data = data;
  }
}
