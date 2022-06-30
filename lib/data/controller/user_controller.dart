
import 'package:get/get.dart';
import 'package:intro_ticket/data/repository/user_repository.dart';

class UserController extends GetxController {
  final UserRepository userRepo;
  List<dynamic> _userList = [];
  List<dynamic> get userList => _userList;

  UserController({required this.userRepo});

  
}