import 'package:paktani_mobile/common/state_enum.dart';
import 'package:paktani_mobile/presentation/provider/onair_tvseries_notifier.dart';
import 'package:paktani_mobile/presentation/widgets/tvseries_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnAirTVSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/onair_tv_series';

  @override
  State<OnAirTVSeriesPage> createState() => _OnAirTVSeriesPageState();
}

class _OnAirTVSeriesPageState extends State<OnAirTVSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<OnAirTVSeriesNotifier>(context, listen: false)
            .fetchOnAirTVSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('On Air TV Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<OnAirTVSeriesNotifier>(
          builder: (context, data, child) {
            if (data.state == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.state == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tv = data.tvSeries[index];
                  return TVSeriesCard(tv);
                },
                itemCount: data.tvSeries.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ),
    );
  }
}
