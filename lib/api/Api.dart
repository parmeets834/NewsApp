import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:model_architecture/Globals/Globals.dart';
import 'package:model_architecture/api/api_service.dart';
import 'package:model_architecture/constantPackage/constStrings.dart';
import 'package:model_architecture/constantPackage/constStrings.dart';
import 'package:model_architecture/constantPackage/constStrings.dart';
import 'package:model_architecture/constantPackage/constStrings.dart';
import 'package:model_architecture/model/file_placeholder.dart';
import 'package:model_architecture/model/uploadFileDetailsModel.dart';
import 'package:path/path.dart';

class Api {
/*  Dio dio=ApiService(baseOptions:  BaseOptions(
    baseUrl: "https://news.inrexa.com",
    connectTimeout: 10000,
    receiveTimeout: 10000,)).getclient();*/
  Dio dio = ApiService().getclient();

  Future<Response> requestSamplePost(
      String name, String email, String password, String authlvl) async {
    var formData = FormData.fromMap({
      "name": "wendux",
      "email": "asndk@gmail.com",
      "password": "asndk@gmail.com",
      "authlvl": 2,
      "authcode": AUTH_CODE,
    });

    return dio.post("/signup.php", data: await formData);
  }

  Future<Response> uploadGeneralPost(String title, String description,
      dynamic attachment, String authlvl) async {
    var encoded = utf8.encode(description);
    var decoded = utf8.decode(encoded);
    print(decoded);

    // var map={"postimage":"dasd","data":attachment};

    var formData = FormData.fromMap({
      "title": title,
      "description": description,
      "attachments": jsonEncode(attachment),
      "cdescription": utf8.encode(description).toString(),
      "ctitle": utf8.encode(title).toString(),
      "authcode": AUTH_CODE,
    });

    return dio.post("/uploadgeneral.php", data: await formData);
  }

  Future<Response> searchPost(String sno) async {
    return dio.post(
      "/search.php",
    );
  }

  Future<Response> getGeneralPost(String sno) async {
    return dio.post("/generalpost.php");
  }

  Future<Response> getDepartmentPost(String sno) async {
    return dio.post("/departmentpost.php");
  }


  Future<Response> searchGeneralPost(
      {String searchwords,
      String fromdate,
      String todate,
      int department}) async {
    // var map={"postimage":"dasd","data":attachment};

    var formData = FormData.fromMap({
      "searchwords": searchwords,
      "fromdate": fromdate,
      "todate": todate,
      "department": department,
    });

    return dio.post("/search.php", data: await formData);
  }

  Future<Response> searchDepartmentPost(
      {String searchwords,
        String fromdate,
        String todate,
        String department}) async {
    // var map={"postimage":"dasd","data":attachment};

    var formData = FormData.fromMap({
      "searchwords": searchwords,
      "fromdate": fromdate,
      "todate": todate,
      "department": department,
    });

    return dio.post("/deptsearch.php", data: await formData);
  }


  Future<Response> login(String email, String password) async {


    var formData = FormData.fromMap({
      "email": email,
      "password": password,
    });

    return dio.post("/login.php", data: await formData);
  }

  Future<Response> signUp(
      {String name,
      String email,
      String phone,
      int deptno,
      String password}) async {
    // var map={"postimage":"dasd","data":attachment};

    var formData = FormData.fromMap({
      "email": email+"",
      "password": password+"",
      "authcode":AUTH_CODE,
      "name":name+"",
      "authlvl":"2",
      "departmentnumber":deptno,

    });

    return dio.post("/signup.php", data: await formData);
  }

  Future<Response> addnewDepartment(String departmentname) async {
    // var map={"postimage":"dasd","data":attachment};

    var formData = FormData.fromMap({
      "departmentname": departmentname,
    });

    return dio.post("/createdepartment.php", data: await formData);
  }

  Future<Response> uploadDepartmentPost(String title, String description,
      dynamic attachment, String authlvl) async {
    var encoded = utf8.encode(description);
    var decoded = utf8.decode(encoded);
    print(decoded);

    // var map={"postimage":"dasd","data":attachment};

    var formData = FormData.fromMap({
      "title": title,
      "description": description,
      "attachments": jsonEncode(attachment),
      "cdescription": utf8.encode(description).toString(),
      "ctitle": utf8.encode(title).toString(),
      "authcode": AUTH_CODE,
    });

    return dio.post("/uploadgeneral.php", data: await formData);
  }

 Future<Response> getDepartmentApi() {
   return dio.get("/getDepartments.php",);
  }
}
