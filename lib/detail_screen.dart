import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:freelance/enums/store_state.dart';
import 'package:freelance/store/detail_store.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<DetailStore>(
        create: (context) => DetailStore(),
        builder: (context, _) {
          final store = context.read<DetailStore>();
          store.getDetails();
          return Scaffold(
            backgroundColor: const Color(0xffF5F5F5),
            appBar: AppBar(
              title: const Text('Detail'),
              centerTitle: true,
              backgroundColor: const Color(0xffF14844),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Observer(builder: (_) {
                final state = store.state;
                final list = store.details;
                switch (state) {
                  case StoreState.LOADING:
                    return const CircularProgressIndicator(
                      color: Color(0xffF14844),
                    );
                  case StoreState.SUCCESS:
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return DetailBox(
                          name: list[index].name,
                          img: list[index].imgUrl,
                        );
                      },
                      itemCount: list.length,
                    );
                  case StoreState.ERROR:
                    return const SizedBox();
                  case StoreState.EMPTY:
                    return const Center(child: Text('Empty'));
                }
              }),
            ),
          );
        });
  }
}

class DetailBox extends StatelessWidget {
  const DetailBox({required this.name, required this.img, Key? key})
      : super(key: key);

  final String name;
  final String img;

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
                  // 'https://demo.medrpha.com/images/logo-1.png',
                  'https://superadmin.medrpha.com/allimage/$img',
                  fit: BoxFit.fill,
                )),
            Container(
              alignment: Alignment.center,
              child: Text(
                name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
