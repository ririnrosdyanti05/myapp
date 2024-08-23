import 'package:get/get.dart';

import '../controllers/tag_berita_controller.dart';

class TagBeritaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TagBeritaController>(
      () => TagBeritaController(),
    );
  }
}
