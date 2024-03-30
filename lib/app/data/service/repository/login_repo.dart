
import '../../api/api_client.dart';
import '../../api/api_path.dart';

class LoginRepository{
  LoginRepository();

  Future<dynamic>  login(String username,String password) async{
    try{
      Map<String,dynamic> body = {
          "email": username,
          "password": password
      };

      final response = await ApiClient.client.postAPi(APIPath.kLogin, body: body);

      return response;
    }catch(e){
      return Future.error(e);
    }
  }

}