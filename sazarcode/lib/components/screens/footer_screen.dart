import 'package:flutter/material.dart';

class FooterScreen extends StatelessWidget {
  const FooterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.4,
              color: Theme.of(context).colorScheme.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Follow me in my social media',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                          size: 46,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      ),
                      const Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Send me an email',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
