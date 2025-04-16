import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flowery/features/profile/data/model/user_response.dart';

enum EditProfileStatus { initial, loading, success, failure }

class EditProfileState extends Equatable {
  final EditProfileStatus status;
  final UserResponse? profile;
  final String? errorMessage;
  final File? photo;  // This will hold the current selected photo or uploaded photo

  const EditProfileState({
    this.status = EditProfileStatus.initial,
    this.profile,
    this.errorMessage,
    this.photo,
  });

  EditProfileState copyWith({
    EditProfileStatus? status,
    UserResponse? profile,
    String? errorMessage,
    File? photo,  // Add this to allow updating the photo in the state
  }) {
    return EditProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      errorMessage: errorMessage ?? this.errorMessage,
      photo: photo ?? this.photo,  // Update photo if provided
    );
  }

  @override
  List<Object?> get props => [status, profile, errorMessage, photo];  // Include photo in props
}
