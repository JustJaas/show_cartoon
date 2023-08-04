part of 'cartoon_bloc.dart';

class CartoonState extends Equatable {
  final List<EpisodesResult> episodes;
  final List<CharactersResult> characters;
  final String page;
  final bool isLoading;

  const CartoonState({
    required this.episodes,
    required this.characters,
    required this.page,
    required this.isLoading,
  });

  CartoonState copyWith({
    List<EpisodesResult>? episodes,
    List<CharactersResult>? characters,
    String? page,
    bool? isLoading,
  }) {
    return CartoonState(
      episodes: episodes ?? this.episodes,
      characters: characters ?? this.characters,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        episodes,
        characters,
        page,
        isLoading,
      ];
}
