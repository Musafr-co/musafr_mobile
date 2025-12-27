abstract class DomainResponse<T> {}

class DomainSuccess<T> extends DomainResponse<T> {
  final T data;

  DomainSuccess(this.data);
}

class DomainFailure<T> extends DomainResponse<T> {
  final String error;
  final T? data;

  DomainFailure({required this.error, required this.data});
}
