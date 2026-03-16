import 'package:flutter/foundation.dart';
import 'package:college_project/models/user_models.dart';

class UserProvider extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

