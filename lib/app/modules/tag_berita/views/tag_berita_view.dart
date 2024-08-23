import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tag_berita_controller.dart';

class TagBeritaView extends GetView<TagBeritaController> {
  const TagBeritaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TagBeritaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TagBeritaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
