abstract class NewsStates {}


class NewsInitialState extends NewsStates {}


class NewsBottomNavState extends NewsStates {}

class NewsBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates
{
   late final String error;
NewsGetBusinessErrorState(this.error);

}

class NewsSportsLoadingState extends NewsStates {}

class NewsGteSportsSuccessState extends NewsStates {}


class NewsGetSportsErrorState extends NewsStates
{

  late final String error;

  NewsGetSportsErrorState(this.error);

}

class NewsSinceLoadingState extends NewsStates {}

class NewsGteSinceSuccessState extends NewsStates {}


class NewsGetSinceErrorState extends NewsStates
{
  late final String error;

  NewsGetSinceErrorState(this.error);
}

class NewsAppChangeModeState extends NewsStates {}