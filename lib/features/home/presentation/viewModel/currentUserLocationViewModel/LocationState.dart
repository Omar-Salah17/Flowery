abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSuccess extends LocationState {
  final String plusCode;
  final String areaName;

  LocationSuccess({required this.plusCode, required this.areaName});
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
