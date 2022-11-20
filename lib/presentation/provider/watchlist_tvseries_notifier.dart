import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_watchlist_tvseries.dart';
import 'package:flutter/foundation.dart';

class WatchlistTVSeriesNotifier extends ChangeNotifier {
  var _watchlistTVSeries = <TVSeries>[];
  List<TVSeries> get watchlistTVSeries => _watchlistTVSeries;

  var _watchlistState = RequestState.Empty;
  RequestState get watchlistState => _watchlistState;

  String _message = '';
  String get message => _message;

  WatchlistTVSeriesNotifier({required this.getWatchlistTVSeries});
  final GetWatchlistTVSeries getWatchlistTVSeries;
  Future<void> fetchWatchlistTVSeries() async {
    _watchlistState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTVSeries.execute();
    result.fold(
      (failure) {
        _watchlistState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (TVSeriesData) {
        _watchlistState = RequestState.Loaded;
        _watchlistTVSeries = TVSeriesData;
        notifyListeners();
      },
    );
  }
}
