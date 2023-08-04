import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:show_cartoon/ui/pages/character_page.dart';
import 'package:show_cartoon/ui/widgets/appbar_widget.dart';
import 'package:show_cartoon/ui/widgets/image_widget.dart';

import '../blocs/cartoon/cartoon_bloc.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  ScrollController scrollController = ScrollController();
  late CartoonBloc cartoonBloc;

  @override
  void initState() {
    cartoonBloc = BlocProvider.of<CartoonBloc>(context);
    cartoonBloc.add(const GetCharacters());
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        cartoonBloc.add(GetMoreCharacter(urlPage: cartoonBloc.state.page));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(name: "Personajes"),
      body: BlocBuilder<CartoonBloc, CartoonState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FadeInDown(
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          cartoonBloc.add(SearchCharacter(query: value));
                        },
                        decoration: const InputDecoration(
                          labelText: 'Buscar por nombre',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: state.isLoading
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Lottie.asset(
                          'assets/lotties/loader.json',
                          height: 100,
                        ),
                      )
                    : FadeInUp(
                        child: ListView.builder(
                            controller: scrollController,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.characters.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CharacterPage(
                                            character:
                                                state.characters[index])),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.teal[100],
                                  ),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ImageWidget(
                                                path: state
                                                    .characters[index].image!),
                                            Column(
                                              children: [
                                                Text(
                                                  state.characters[index].name!,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "${state.characters[index].episode!.length} episodios",
                                                  style: const TextStyle(
                                                    color: Colors.blueGrey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
