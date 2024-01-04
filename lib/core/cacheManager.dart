

import 'package:get_storage/get_storage.dart';


mixin CacheManager {


  Future<bool> saveLoginResponse(String? loginResponse) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.LOGINRESPONSE.toString(), loginResponse);
    return true;
  }

  String? getLoginResponse() {
    final box = GetStorage();
    return box.read(CacheManagerKey.LOGINRESPONSE.toString());
  }

  Future<void> removeLoginResponse() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.LOGINRESPONSE.toString());
  }


  Future<bool> saveResponseId(bool value) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.SPLASHRESPONSE.toString(), value);
    return true;
  }

  bool? getResponseId() {
    final box = GetStorage();

    return box.read(CacheManagerKey.SPLASHRESPONSE.toString());
  }

  Future<void> removeSplashId() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.SPLASHRESPONSE.toString());
  }




}

enum CacheManagerKey { TOKEN,LOGINRESPONSE,SPLASHRESPONSE }