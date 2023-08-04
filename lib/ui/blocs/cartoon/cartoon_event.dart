part of 'cartoon_bloc.dart';

abstract class CartoonEvent extends Equatable {
  const CartoonEvent();

  @override
  List<Object> get props => [];
}

class GetEpisode extends CartoonEvent {
  const GetEpisode();
}

class GetMoreEpisode extends CartoonEvent {
  final String urlPage;
  const GetMoreEpisode({required this.urlPage});
}

class GetCharacters extends CartoonEvent {
  final String? page;
  const GetCharacters({this.page});
}

class GetMoreCharacter extends CartoonEvent {
  final String urlPage;
  const GetMoreCharacter({required this.urlPage});
}

class SearchCharacter extends CartoonEvent {
  final String query;
  const SearchCharacter({required this.query});
}

class ChangeLoading extends CartoonEvent {
  final bool loading;
  const ChangeLoading({required this.loading});
}
