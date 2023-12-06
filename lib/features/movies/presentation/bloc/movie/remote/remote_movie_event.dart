/// This file contains all the events that are used in the RemoteMoviesBloc

/// This is the base class for all events
abstract class RemoteMoviesEvent {
  const RemoteMoviesEvent();
}

/// This event is used to get all movies from the API
class GetAllMovies extends RemoteMoviesEvent {
  const GetAllMovies();
}
