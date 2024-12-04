abstract class ApiConsumer {
  Future<dynamic> get(String path,
      {Object? data, Map<String, dynamic>? queryParemeter});
  Future<dynamic> post(String path,
      {Object? data,
      Map<String, dynamic>? queryParemeter,
      bool isformData = false});
  Future<dynamic> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParemeter,
      bool isformData = false});
  Future<dynamic> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParemeter,
      bool isformData = false});
}
