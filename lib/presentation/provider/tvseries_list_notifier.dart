import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_onair_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_popular_tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_top_rated_tvseries.dart';
import 'package:flutter/foundation.dart';

class TVSeriesListNotifier extends ChangeNotifier {
  var _onAirTVSeries = <TVSeries>[];
  List<TVSeries> get onAirTVSeries => _onAirTVSeries;

  RequestState _onAirState = RequestState.Empty;
  RequestState get onAirState => _onAirState;

  var _popularTVSeries = <TVSeries>[];
  List<TVSeries> get popularTVSeries => _popularTVSeries;

  RequestState _popularTVSeriesState = RequestState.Empty;
  RequestState get popularTVSeriesState => _popularTVSeriesState;

  var _topRatedTVSeries = <TVSeries>[];
  List<TVSeries> get topRatedTVSeries => _topRatedTVSeries;

  RequestState _topRatedTVSeriesState = RequestState.Empty;
  RequestState get topRatedTVSeriesState => _topRatedTVSeriesState;

  String _message = '';
  String get message => _message;

  TVSeriesListNotifier({
    required this.getOnAirTVSeries,
    required this.getPopularTVSeries,
    required this.getTopRatedTVSeries,
  });

  final GetOnAirTVSeries getOnAirTVSeries;
  final GetPopularTVSeries getPopularTVSeries;
  final GetTopRatedTVSeries getTopRatedTVSeries;

  Future<void> fetchOnAirTVSeries() async {
    _onAirState = RequestState.Loading;
    notifyListeners();

    final result = await getOnAirTVSeries.execute();
    result.fold((failure) {
      _onAirState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (tvSeriesData) {
      _onAirState = RequestState.Loaded;
      _onAirTVSeries = tvSeriesData;
      notifyListeners();
    });
  }

  Future<void> fetchPopularTVSeries() async {
    _popularTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVSeries.execute();
    result.fold(
      (failure) {
        _popularTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _popularTVSeriesState = RequestState.Loaded;
        _popularTVSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTVSeries() async {
    _topRatedTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTVSeries.execute();
    result.fold(
      (failure) {
        _topRatedTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _topRatedTVSeriesState = RequestState.Loaded;
        _topRatedTVSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }
}
