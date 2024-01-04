
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_task/model/dashboadModel.dart';
import 'package:flutter_task/model/splashModel.dart';
import 'package:flutter_task/services/api/api_endpoint.dart';
import 'package:flutter_task/services/api/api_hitter.dart';
import 'package:flutter_task/services/base/base_repository.dart';


class ApiController extends BaseRepository {

  Future<LoginModel> loginUser(String username,String password) async {
    var formData = FormData.fromMap({
      'email':'${username}',
      'password':'${password}'
    });
    print('url ${ApiEndpoint.loginUrl}');
   // print('data ${json.encode(formData)}');

    ApiResponse? apiResponse = await apiHitter.getRawPostApiResponse(ApiEndpoint.loginUrl, formData:formData);
    {
      try {

        if (apiResponse!.responseCode == 200) {
          print("jsonresponse");

          return LoginModel.fromJson(apiResponse.response.data);
        } else {
          if (apiResponse.responseCode == 201) {
            return LoginModel.fromJson(json.decode(apiResponse.response));
          } else {
            return LoginModel.fromJson(json.decode(apiResponse.response));
          }
        }
      } catch (error) {
        return LoginModel();
      }
    }
  }






 listingData() async {
    print('url ${ApiEndpoint.homeUrl}');
    /// print('data ${json.encode(formData)}');
    ApiResponse? apiResponse = await apiHitter.getApiResponse(ApiEndpoint.homeUrl);
    {
      try {

        if (apiResponse!.responseCode == 200) {
          print("jsonresponse");

          return apiResponse.response.data;
        } else {
          if (apiResponse.responseCode == 201) {
            return json.decode(apiResponse.response);
          } else {
            return json.decode(apiResponse.response);
          }
        }
      } catch (error) {

      }
    }
  }









}