import 'package:dio/dio.dart';

/// DataState is the abstract class that is responsible for the data state.
abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

/// DataLoading is the data state that is responsible for loading.
class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

/// DataDone is the data state that is responsible for done.
class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
