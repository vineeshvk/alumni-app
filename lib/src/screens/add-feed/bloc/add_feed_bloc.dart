import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_event.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFeedBloc extends Bloc<AddFeedEvent, AddFeedState> {
  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final imageCtrl = TextEditingController();
  final contactCtrl = TextEditingController();
  final venueCtrl = TextEditingController();
  final scheduledDateCtrl = TextEditingController();

  @override
  AddFeedState get initialState => AddFeedInitialState();

  @override
  Stream<AddFeedState> mapEventToState(AddFeedEvent event) async* {
    if (event is AddFeedEvent) {}
  }
}
