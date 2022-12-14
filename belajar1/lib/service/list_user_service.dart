import 'package:belajar1/Model/list_user.dart';
import 'package:dio/dio.dart';


class ListUsersService {
  Dio dio = Dio();
  Future<List<ListUserModel>?> getDataUsers() async {
    
    String url = "https://koperasiundiksha.000webhostapp.com/users";
    final Response response;

    try {
      response = await dio.get(url); 

      print(response.data);
      if(response.statusCode == 200){
        var json = response.data;
        if (json is Map && json.keys.contains('data')){
          var data = json['data'];
          if (data is List) {
            dynamic send = data
            .map<ListUserModel>((u) => ListUserModel.fromJson(u))
            .toList();
            print(send);
            return(send);
            
          }
        }
      }
      return null;
    } 
    
    
    on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }

  // login service
  Future<ListUserModel?> loginUsers({
    required String email,
    required String password,
  }) async{
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com";
    final Response response;

    try{
      response = await dio.post(
        url,
        data: {"username": email, "password": password},
      );
      if(response.statusCode==200){
        var json = response.data;

        if(!json.keys.contains('data')){
          return null;
        }else{
          if(json['data'] is List){
            var data = json['data'];

            List<dynamic> dataList = (data as List).cast<dynamic>();
            print(dataList);

             double? balence = double.parse(dataList[0]['saldo']);
            int? id = int.parse(dataList[0]['user_id']);

            ListUserModel user = ListUserModel(
              user_id: id,
              username: dataList[0]['username'],
              nama: dataList[0]['nama'],
              // avatar: "https://reqres.in/img/faces/1-image.jpg",
              saldo: balence,
      
            );
             return user;
          }
    }
        }
        return null;
      }on DioError catch (error, stacktrace) {
          print('Exception occured: $error stackTrace: $stacktrace');
          throw Exception(error.response);
    }
  }
// register service
   Future<ListUserModel?> registerUsers(
      {required String password,
      required String name,
      required String email}) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/register";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "username": email,
          "password": password,
          "nama": name,
        },
      );

      // mengecek apakah berhasil login dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        print(data['status']);
        if (data['status'] != 'error') {
          return null;
        } else {
          Future<ListUserModel?> result =
              loginUsers(password: password, email: email);
          print(result);
          return result;
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
// servise transfer

setSetoran($userId, $setoran) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/setoran";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "user_id": $userId,
          "jumlah_setoran": $setoran,
        },
      );

      // mengecek apakah berhasil login dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        print(data);
        if (data['status'] == 'error') {
          return null;
        } else {
          return data;
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
// service tarik

  setTarik($id, $tarik) async {
    Dio dio = Dio();
    String url = "https://koperasiundiksha.000webhostapp.com/tarikan";
    final Response response;

    try {
      response = await dio.post(
        url,
        data: {
          "user_id": $id,
          "jumlah_tarikan": $tarik,
        },
      );

      // mengecek apakah berhasil login dengan mengecek status code
      if (response.statusCode == 200) {
        var json = response.data;
        var data = json;

        print(data);
        if (data['status'] == 'error') {
          return null;
        } else {
          return data;
        }
      }
      return null;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      throw Exception(error.response);
    }
  }
    
  // postLogin(String username, String password) async {
  //   String url= "https://reqres.in/api/users";
  //   final Response response;
  //   FormData formData = FormData.fromMap(
  //     {
  //       "name": username,
  //       "job": password,
  //     },
  //   );
    
  //   try{
  //     response = await dio.post(
  //       url,
  //       data: formData,
  //     );
  //     print(response.data);
  //   }
  //   on DioError catch (error, stacktrace){
  //     print ('Exception occured: $error stackTrace: $stacktrace');
  //     throw Exception(error.response);
  //   }

  // }

 
}