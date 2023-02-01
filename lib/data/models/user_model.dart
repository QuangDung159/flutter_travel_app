class UserModel {
  final String _id;
  final String? userName;

  UserModel(this._id, this.userName);

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    {
      return UserModel(
        json?['_id'],
        json?['user_name'],
      );
    }
  }
}
