import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';


@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse(
      @JsonKey(name: 'error')
      bool isError,
      String message,
      List<Map<String, dynamic>> data,
      ) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
}