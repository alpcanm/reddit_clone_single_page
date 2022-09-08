part of 'pagination_bloc.dart';

abstract class PaginationEvent {}

class PaginationFetch extends PaginationEvent {
  final PaginationStatus? status;

  PaginationFetch({this.status});
}
