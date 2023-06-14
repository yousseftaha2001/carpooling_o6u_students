import 'package:get_storage/get_storage.dart';

class MyDataBase {
  static final box = GetStorage();

  static Future<void> insertData({
    required String token,
    required String studnetId,
    required String photo,
  
   
   
    
  
    
  }) async {
    await box.write('token', token);
    await box.write('studnetId', studnetId);
    await box.write('photo', photo);

  }

  static void removeDate() async {
    await box.remove('token');
    await box.remove('studnetId');
    await box.remove('photo');

  }

  static void updatePassword(String newPass) {
    box.write('pass', newPass);
  }

  static String getToken() => box.read('token') ?? '';
  static String getStudnetId() => box.read('studnetId') ?? '';
  static String getStudentPhoto() => box.read('photo') ?? '';

 
}
