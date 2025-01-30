abstract class UserEvent {}

class FetchUserData extends UserEvent {
  final String uid;

  FetchUserData(this.uid);
}

class UpdateUserData extends UserEvent {
  final String uid;
  final Map<String, dynamic> updatedData;

  UpdateUserData(this.uid, this.updatedData);
}
class FetchUserPersonalData extends UserEvent {
  final String uid;

  FetchUserPersonalData(this.uid);
}

class UpdateUserPersonalData extends UserEvent {
  final String uid;
  final Map<String, dynamic> updatedData;

  UpdateUserPersonalData(this.uid, this.updatedData);
}

class FetchCompleteUserData extends UserEvent {
  final String uid;

  FetchCompleteUserData(this.uid);
}