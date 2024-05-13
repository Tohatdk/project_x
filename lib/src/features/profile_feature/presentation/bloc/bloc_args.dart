class ProfileBlocsCommunicationsArgs {
  final String email;
  final String? username;
  final String? photoUrl;

  ProfileBlocsCommunicationsArgs({
    required this.email,
    this.username,
    this.photoUrl,
  });
}
