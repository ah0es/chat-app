part of 'rigester_cubit.dart';

@immutable
abstract class RigesterState {}

final class RigesterLoading extends RigesterState {}
final class RigesterInitial extends RigesterState {}

final class RigesterSuccess extends RigesterState {}

final class RigesterFailure extends RigesterState {
  String errorMessage;

  RigesterFailure({required this.errorMessage});
}
