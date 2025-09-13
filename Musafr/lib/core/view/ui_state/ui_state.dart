// ui_state.dart
import 'package:equatable/equatable.dart';

/// An abstract base class representing the different UI states for data operations.
/// This mimics the behavior of a Kotlin sealed class, allowing for exhaustive
/// checking of states.
///
/// [T] is the type of data that the state might hold.
abstract class UiState<T> extends Equatable {
  /// Optional data associated with the current UI state.
  /// This can be used to display stale data during loading or error states.
  final T? data;

  const UiState({this.data});

  @override
  List<Object?> get props => [data];
}

/// Represents an idle or initial state where no operation is in progress.
class UiIdle<T> extends UiState<T> {
  const UiIdle({super.data});

  @override
  List<Object?> get props => [data]; // Re-include data in props for Equatable
}

/// Represents a loading state, indicating an ongoing asynchronous operation.
/// It can optionally hold existing data to allow for partial UI updates
/// while new data is being fetched (e.g., showing a spinner over old content).
class UiLoading<T> extends UiState<T> {
  const UiLoading({super.data});

  @override
  List<Object?> get props => [data]; // Re-include data in props for Equatable
}

/// Represents a successful state, where an operation has completed and
/// the result data is available.
class UiSuccess<T> extends UiState<T> {
  /// The required data resulting from the successful operation.
  @override
  final T data;

  const UiSuccess({required this.data}) : super(data: data);

  @override
  List<Object?> get props => [data]; // Re-include data in props for Equatable
}

/// Represents an error state, indicating that an operation has failed.
/// It provides details about the error and can optionally hold previous data.
class UiError<T> extends UiState<T> {
  /// A user-friendly message describing the error.
  final String message;

  /// An optional exception object for debugging purposes.
  final Object? exception;

  /// An optional error code (e.g., HTTP status code).
  final int? code;

  const UiError({
    required this.message,
    this.exception,
    this.code,
    super.data,
  });

  @override
  List<Object?> get props => [message, exception, code, data];
}

extension UiStateCopyWith<T> on UiState<T> {
  UiState<T> copyWithData(T newData) {
    return switch (this) {
      UiIdle<T> _     => UiIdle<T>(data: newData),
      UiLoading<T> _  => UiLoading<T>(data: newData),
      UiSuccess<T> _  => UiSuccess<T>(data: newData),
      UiError<T> e    => UiError<T>(
        message: e.message,
        exception: e.exception,
        code: e.code,
        data: newData,
      ),

      UiState() => this,
    };
  }
}