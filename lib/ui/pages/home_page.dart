import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:show_cartoon/ui/pages/characters_page.dart';
import 'package:show_cartoon/ui/pages/episodes_page.dart';
import 'package:show_cartoon/ui/widgets/appbar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(name: "Cartoon"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: FadeInLeft(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EpisodesPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/background_1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                      child: Transform.rotate(
                        angle: -0.9,
                        child: const RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "Episodios",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              letterSpacing: 5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: FadeInRight(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CharactersPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/background_2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Center(
                        child: Transform.rotate(
                      angle: 0.9,
                      child: const RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "Personajes",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            letterSpacing: 5,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
