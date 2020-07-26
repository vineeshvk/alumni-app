import 'dart:io';

import 'package:alumni_app/src/respositories/feed_respository.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_event.dart';
import 'package:alumni_app/src/screens/add-feed/bloc/add_feed_state.dart';
import 'package:alumni_app/src/utils/firebase_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart' as path;

class AddFeedBloc extends Bloc<AddFeedEvent, AddFeedState> {
  String imageUrl;
  String imagePath;

  final titleCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final contactCtrl = TextEditingController();
  final venueCtrl = TextEditingController();
  final scheduledDateCtrl = TextEditingController();

  @override
  AddFeedState get initialState => AddFeedInitialState();

  @override
  Stream<AddFeedState> mapEventToState(AddFeedEvent event) async* {
    if (event is AddNewFeedEvent) {
      yield* _mapAddFeedEventToState();
    }
    if (event is AddImageEvent) {
      yield* _mapAddImageEventToState();
    }
  }

  Stream<AddFeedState> _mapAddFeedEventToState() async* {
    try {
      yield AddFeedLoadingState();
      await FeedRepository.addFeed(
        contact: contactCtrl.text,
        description: descriptionCtrl.text,
        venue: venueCtrl.text,
        scheduledDate: scheduledDateCtrl.text,
        image: imageUrl,
        title: titleCtrl.text,
      );

      yield AddFeedSuccessState();
    } catch (error) {
      yield AddFeedFailureState(error: error.toString());
    }
  }

  Stream<AddFeedState> _mapAddImageEventToState() async* {
    try {
      yield AddImageLoadingState();

      File file = await FilePicker.getFile(type: FileType.image);
      imagePath = path.basename(file.path);
      print("image path = $imagePath");

      imageUrl = await FirebaseHelper.uploadImage(file);
      print("image url = $imageUrl");

      if (imageUrl == null) {
        imagePath = "";
        yield AddFeedFailureState(error: "Uploading image not successful");
      } else
        yield AddImageSuccessState();
    } catch (e) {
      print("error ==== $e");
    }
  }
}
