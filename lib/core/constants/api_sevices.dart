import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});

  /// Generic GET request
  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await dio.get(
        endPoint,
        queryParameters: queryParameters,
      );

      // نتأكد إن response.data Map<String, dynamic>
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        // إذا كان response.data List أو أي نوع آخر نلفه في Map
        return {"results": response.data};
      }
    } on DioError catch (e) {
      // Handle Dio errors
      throw Exception("ApiService GET request failed: ${e.message}");
    }
  }
}

//   /// Generic POST request (optional)
//   Future<Map<String, dynamic>> post({
//     required String endPoint,
//     Map<String, dynamic>? body,
//   }) async {
//     try {
//       final Response response = await dio.post(
//         endPoint,
//         data: body,
//       );
//
//       if (response.data is Map<String, dynamic>) {
//         return response.data;
//       } else {
//         return {"results": response.data};
//       }
//     } on DioError catch (e) {
//       throw Exception("ApiService POST request failed: ${e.message}");
//     }
//   }
// }
