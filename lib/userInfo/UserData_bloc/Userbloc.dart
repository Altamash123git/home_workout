import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_workout/userInfo/UserData_bloc/userEvent.dart';
import 'package:home_workout/userInfo/UserData_bloc/userState.dart';

import '../../firebase_repo.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<FetchUserData>((event, emit) async {
      emit(UserLoading());
      try {
        final userData = await userRepository.getUserData(event.uid);
        if (userData != null) {
          emit(UserLoaded(userData: userData)); // Pass the actual userData
        } else {
          emit(UserError(message: 'User not found.'));
        }
      } catch (e) {
        emit(UserError(message: 'Error fetching user data: $e'));
      }
    });

    on<UpdateUserData>((event, emit) async {
      try {
        await userRepository.updateUserData(event.uid, event.updatedData);
        add(FetchUserData(event.uid)); // Refresh user data after update
      } catch (e) {
        emit(UserError(message: 'Error updating user data: $e'));
      }
    });
    on<FetchCompleteUserData>((event, emit) async {
      emit(UserLoading());
      try {
        final userData = await userRepository.getCompleteUserData(event.uid);
        if (userData != null) {
          emit(UserLoaded(userData: userData)); // Pass the actual userData
        } else {
          emit(UserError(message: 'User not found.'));
        }
      } catch (e) {
        emit(UserError(message: 'Error fetching user data: $e'));
      }
    });
    on<FetchUserPersonalData>((event, emit) async {
      emit(UserLoading());
      try {
        final userData = await userRepository.getUserPersonalData(event.uid);
        if (userData != null) {
          emit(UserLoaded(userData: userData)); // Pass the actual userData
        } else {
          emit(UserError(message: 'User not found.'));
        }
      } catch (e) {
        emit(UserError(message: 'Error fetching user data: $e'));
      }
    });

    on<UpdateUserPersonalData>((event, emit) async {
      try {
        await userRepository.updateUserPersonalData(event.uid, event.updatedData);
        add(FetchUserData(event.uid)); // Refresh user data after update
      } catch (e) {
        emit(UserError(message: 'Error updating user data: $e'));
      }
    });
  }
}

