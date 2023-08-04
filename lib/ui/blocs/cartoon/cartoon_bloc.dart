import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:show_cartoon/data/services/cartoon_service.dart';
import 'package:show_cartoon/domain/models/characters_model.dart';
import 'package:show_cartoon/domain/models/episodes_model.dart';

part 'cartoon_event.dart';
part 'cartoon_state.dart';

final String episodeURL = dotenv.get("EPISODE");
final String characterURL = dotenv.get("CHARACTER");

class CartoonBloc extends Bloc<CartoonEvent, CartoonState> {
  CartoonBloc()
      : super(const CartoonState(
          episodes: [],
          characters: [],
          page: "",
          isLoading: false,
        )) {
    on<GetEpisode>((event, emit) async {
      add(const ChangeLoading(loading: true));
      final response = await CartoonService().getData(episodeURL);

      Episodes episodesResponse = Episodes.fromJson(response);

      emit(state.copyWith(
        episodes: episodesResponse.results,
        isLoading: false,
        page: episodesResponse.info!.next,
      ));
    });

    on<GetMoreEpisode>((event, emit) async {
      final dynamic response;
      response = await CartoonService().getData(event.urlPage);
      Episodes episodesResponse = Episodes.fromJson(response);
      List<EpisodesResult> newEpisodes = [];
      if (state.episodes.isNotEmpty) {
        newEpisodes.addAll(state.episodes);
      }
      if (episodesResponse.results!.isNotEmpty) {
        newEpisodes.addAll(episodesResponse.results!);
      }
      emit(state.copyWith(
        episodes: newEpisodes,
        page: episodesResponse.info!.next,
      ));
    });

    on<GetCharacters>((event, emit) async {
      add(const ChangeLoading(loading: true));

      final response = await CartoonService().getData(characterURL);
      Characters charactersResponse = Characters.fromJson(response);

      emit(state.copyWith(
        characters: charactersResponse.results,
        page: charactersResponse.info!.next,
        isLoading: false,
      ));
    });

    on<GetMoreCharacter>((event, emit) async {
      final dynamic response;
      response = await CartoonService().getData(event.urlPage);
      Characters charactersResponse = Characters.fromJson(response);
      List<CharactersResult> newCharacters = [];
      if (state.characters.isNotEmpty) {
        newCharacters.addAll(state.characters);
      }
      if (charactersResponse.results!.isNotEmpty) {
        newCharacters.addAll(charactersResponse.results!);
      }
      emit(state.copyWith(
        characters: newCharacters,
        page: charactersResponse.info!.next,
      ));
    });

    on<SearchCharacter>((event, emit) async {
      add(const ChangeLoading(loading: true));

      final response =
          await CartoonService().getData("$characterURL?name=${event.query}");
      Characters charactersResponse = Characters.fromJson(response);

      emit(state.copyWith(
        characters: charactersResponse.results,
        isLoading: false,
      ));
    });

    on<ChangeLoading>((event, emit) {
      emit(state.copyWith(isLoading: event.loading));
    });
  }
}
