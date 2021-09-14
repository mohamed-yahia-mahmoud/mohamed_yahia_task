// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeMobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on HomeMobx, Store {
  final _$imgListAtom = Atom(name: 'HomeMobx.imgList');

  @override
  List<String> get imgList {
    _$imgListAtom.reportRead();
    return super.imgList;
  }

  @override
  set imgList(List<String> value) {
    _$imgListAtom.reportWrite(value, super.imgList, () {
      super.imgList = value;
    });
  }

  final _$currentAtom = Atom(name: 'HomeMobx.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$indexAtom = Atom(name: 'HomeMobx.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$nameAtom = Atom(name: 'HomeMobx.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$imageSlidersAtom = Atom(name: 'HomeMobx.imageSliders');

  @override
  List<Widget> get imageSliders {
    _$imageSlidersAtom.reportRead();
    return super.imageSliders;
  }

  @override
  set imageSliders(List<Widget> value) {
    _$imageSlidersAtom.reportWrite(value, super.imageSliders, () {
      super.imageSliders = value;
    });
  }

  final _$getAllProperitiesResponseAtom =
      Atom(name: 'HomeMobx.getAllProperitiesResponse');

  @override
  GetAllProperitiesResponse get getAllProperitiesResponse {
    _$getAllProperitiesResponseAtom.reportRead();
    return super.getAllProperitiesResponse;
  }

  @override
  set getAllProperitiesResponse(GetAllProperitiesResponse value) {
    _$getAllProperitiesResponseAtom
        .reportWrite(value, super.getAllProperitiesResponse, () {
      super.getAllProperitiesResponse = value;
    });
  }

  final _$myPropertiesAtom = Atom(name: 'HomeMobx.myProperties');

  @override
  ObservableList<ProperityModel> get myProperties {
    _$myPropertiesAtom.reportRead();
    return super.myProperties;
  }

  @override
  set myProperties(ObservableList<ProperityModel> value) {
    _$myPropertiesAtom.reportWrite(value, super.myProperties, () {
      super.myProperties = value;
    });
  }

  final _$myImgsAtom = Atom(name: 'HomeMobx.myImgs');

  @override
  List<String> get myImgs {
    _$myImgsAtom.reportRead();
    return super.myImgs;
  }

  @override
  set myImgs(List<String> value) {
    _$myImgsAtom.reportWrite(value, super.myImgs, () {
      super.myImgs = value;
    });
  }

  @override
  String toString() {
    return '''
imgList: ${imgList},
current: ${current},
index: ${index},
name: ${name},
imageSliders: ${imageSliders},
getAllProperitiesResponse: ${getAllProperitiesResponse},
myProperties: ${myProperties},
myImgs: ${myImgs}
    ''';
  }
}
