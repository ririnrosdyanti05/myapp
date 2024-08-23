import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //memanggil CounterController kemudian dibungkus oleh variabel c
    CounterController c = Get.put(CounterController());    
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('diklik : ${c.bilangan}'),
              ),
              ElevatedButton(
                onPressed: () {
                  c.tambahSatu();
                }, child: Icon(Icons.add),
            ),
           
              ElevatedButton(
                onPressed: () {
                  c.kurangSatu();
                }, child: Icon(Icons.remove),
            ),
          ],
        ),
      )
    );
  }
}
