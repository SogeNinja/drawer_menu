import 'package:flutter/material.dart';

class ProfileModel{
  final String fullName;
  final String rut;
  final String email;
  final String address;
  final String phone;

  ProfileModel({
    required this.fullName,
    required this.rut,
    required this.email,
    required this.address,
    required this.phone
  });
}

class ProfileCollection extends ChangeNotifier{
  late ProfileModel _selectedProfile;
  ProfileModel get selectedProfile => _selectedProfile;

  void setSelectedProfile(ProfileModel selectedProfile){
    _selectedProfile = selectedProfile;
    notifyListeners();
  }
}

