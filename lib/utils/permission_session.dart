import 'package:click_to_chat/models/permissions_model.dart';
import 'package:get/get.dart';

class PermissionSession{
  static Rx<PermissionsModel> globalPermissions = PermissionsModel.empty().obs;
}