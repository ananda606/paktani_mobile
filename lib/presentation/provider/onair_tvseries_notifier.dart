import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/domain/entities/tvseries.dart';
import 'package:paktani_mobile/domain/usecases/get_onair_tvseries.dart';
import 'package:flutter/foundation.dart';

class OnAirTVSeriesNotifier extends ChangeNotifier {
  final GetOnAirTVSeries getOnAirTVSeries;
  OnAirTVSeriesNotifier({required this.getOnAirTVSeries});
  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TVSeries> _tvSeries = [];
  List<TVSeries> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchOnAirTVSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getOnAirTVSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (TVSeriesData) {
        _tvSeries = TVSeriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
