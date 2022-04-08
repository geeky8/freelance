import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text('Detail'),
        centerTitle: true,
        backgroundColor: const Color(0xffF14844),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return const DetailBox();
          },
          itemCount: 10,
        ),
      ),
    );
  }
}

class DetailBox extends StatelessWidget {
  const DetailBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 50,
                height: 50,
                child: Image.network(
                  'https://demo.medrpha.com/images/logo-1.png',
                  fit: BoxFit.fill,
                )),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Image1',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
