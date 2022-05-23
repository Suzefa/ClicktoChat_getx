class PermissionsModel {
  int isAllPermissionProvided = -1;
  int isCameraPermissionProvided = -1;
  int isExternalStoragePermissionProvided = -1;
  int isStoragePermissionProvided = -1;

  PermissionsModel.empty();

  PermissionsModel.sessionStoreConstructor({
    required this.isAllPermissionProvided,
    required this.isCameraPermissionProvided,
    required this.isExternalStoragePermissionProvided,
    required this.isStoragePermissionProvided,
  });

  static PermissionsModel fromString({required String stringModel}) {
    PermissionsModel permissionsModel = PermissionsModel.empty();
    List<String> values = stringModel.split('.');
    permissionsModel = PermissionsModel.sessionStoreConstructor(
        isAllPermissionProvided: int.parse(values.first),
        isCameraPermissionProvided: int.parse(values[1]),
        isExternalStoragePermissionProvided: int.parse(values[2]),
        isStoragePermissionProvided: int.parse(values.last),);
    return permissionsModel;
  }

  String toStringForSession() {
    return '$isAllPermissionProvided.$isCameraPermissionProvided.$isExternalStoragePermissionProvided.$isStoragePermissionProvided';
  }

  @override
  String toString() {
    return 'PermissionsModel{isAllPermissionProvided: $isAllPermissionProvided, isCameraPermissionProvided: $isCameraPermissionProvided, isExternalStoragePermissionProvided: $isExternalStoragePermissionProvided, isStoragePermissionProvided: $isStoragePermissionProvided}';
  }
}
