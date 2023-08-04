import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:show_cartoon/ui/blocs/cartoon/cartoon_bloc.dart';
import 'package:show_cartoon/ui/widgets/appbar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  ScrollController scrollController = ScrollController();
  late CartoonBloc cartoonBloc;
  @override
  void initState() {
    cartoonBloc = BlocProvider.of<CartoonBloc>(context);
    cartoonBloc.add(const GetEpisode());
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        cartoonBloc.add(GetMoreEpisode(urlPage: cartoonBloc.state.page));
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
      appBar: const AppBarWidget(name: "Episodios"),
      body: BlocBuilder<CartoonBloc, CartoonState>(
        builder: (context, state) {
          return state.isLoading
              ? Center(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Lottie.asset(
                      'assets/lotties/loader.json',
                      height: 400,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  controller: scrollController,
                  child: FadeInUp(
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.episodes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/img/background_3.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    state.episodes[index].episode!,
                                    style: const TextStyle(
                                      letterSpacing: 3,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    state.episodes[index].name!,
                                    style: const TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        state.episodes[index].airDate!,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                );
        },
      ),
    );
  }
}
