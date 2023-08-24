

import 'package:get/get.dart';
import 'package:stream_getx/module/controller/homepage_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomePageController());
  }

}