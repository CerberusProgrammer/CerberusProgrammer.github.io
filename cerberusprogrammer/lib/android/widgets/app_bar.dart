import 'package:cerberusprogrammer/android/widgets/playstore_display.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode = FocusNode();
    return AppBar(
      leading: IconButton(
        icon: Logo(Logos.google_play),
        onPressed: null,
      ),
      title: SizedBox(
        width: 500,
        child: TextFormField(
          focusNode: focusNode,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(40),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(40),
              ),
              filled: true,
              hintText: 'Search my apps in the Play Store'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 1.0, right: 15),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return const PlayStoreDisplay();
                  });
            },
            child: CircleAvatar(
              maxRadius: 23,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                    'https://avatars.githubusercontent.com/u/66286300?v=4'),
              ),
            ),
          ),
        )
      ],
    );
  }
}
