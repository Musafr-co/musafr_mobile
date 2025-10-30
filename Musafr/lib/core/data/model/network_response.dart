import '../../domain/model/domain_response.dart';
import 'dart:convert';

abstract class NetworkResponse<T> {
  DomainResponse<T> toDomainResponse() {
    if (this is NetworkSuccess) {
      NetworkSuccess networkSuccess = this as NetworkSuccess;
      return DomainSuccess(networkSuccess.data);
    } else if (this is NetworkFailure) {
      NetworkFailure failure = this as NetworkFailure;
      return DomainFailure(error: failure.error, data: null);
    } else if (this is NetworkException) {
      NetworkException networkException = this as NetworkException;
      return DomainFailure(
        error: networkException.exception.toString(),
        data: null,
      );
    } else {
      return DomainFailure(error: "Something went wrong", data: null);
    }
  }
}

class NetworkSuccess<T> extends NetworkResponse<T> {
  final T data;
  final String? message;
  final int statusCode;

  NetworkSuccess(this.data, this.message, this.statusCode);
}

class NetworkFailure<T> extends NetworkResponse<T> {
  final String error;
  final T? data;

  NetworkFailure({required String error, required this.data})
    : error = _extractErrorMessage(error);

  static String _extractErrorMessage(String error) {
    String errorMessage = error.replaceAll(RegExp(r'^\"|\"$'), "");
    try{
      List<dynamic> parsedJson = jsonDecode(error);
      return parsedJson.map((element) => element["description"]).join(',');
    }catch(exception){
      return errorMessage;
    }
  }
}

class NetworkException<T> extends NetworkResponse<T> {
  final Exception exception;

  NetworkException(this.exception);
}
