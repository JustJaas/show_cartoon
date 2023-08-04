import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:show_cartoon/domain/models/characters_model.dart';
import 'package:show_cartoon/ui/widgets/appbar_widget.dart';
import 'package:show_cartoon/ui/widgets/image_widget.dart';
import 'package:show_cartoon/ui/widgets/info_widget.dart';

class CharacterPage extends StatelessWidget {
  final CharactersResult character;
  const CharacterPage({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(name: character.name!),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              FadeInDown(child: ImageWidget(path: character.image!, size: 200)),
              const SizedBox(height: 20),
              FadeInUp(
                child: Column(
                  children: [
                    InfoWidget(
                        title: "Especie",
                        info: character.species!,
                        iconTemp: const Icon(Icons.pets_outlined)),
                    InfoWidget(
                        title: "Genero",
                        info: character.gender!,
                        iconTemp: const Icon(Icons.transgender_outlined)),
                    InfoWidget(
                        title: "Estado",
                        info: character.status!,
                        iconTemp: const Icon(Icons.monitor_heart_sharp)),
                    InfoWidget(
                        title: "Ubicación",
                        info: character.location!.name!,
                        iconTemp: const Icon(Icons.map_outlined)),
                    InfoWidget(
                        title: "Origen",
                        info: character.origin!.name!,
                        iconTemp: const Icon(Icons.location_on_outlined)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
