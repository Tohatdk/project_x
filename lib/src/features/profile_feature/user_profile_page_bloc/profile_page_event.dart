part of 'profile_page_bloc.dart';

abstract class ProfilePageEvent{}

class EditNameEvent extends ProfilePageEvent{}

class EditNumberEvent extends ProfilePageEvent{}

class SignoutEvent extends ProfilePageEvent{}

class EditPhotoEvent extends ProfilePageEvent{}