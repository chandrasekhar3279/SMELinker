// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CroppedImageDataStruct extends BaseStruct {
  CroppedImageDataStruct({
    List<String>? imageBytes,
    String? fileName,
    String? mimeType,
  })  : _imageBytes = imageBytes,
        _fileName = fileName,
        _mimeType = mimeType;

  // "imageBytes" field.
  List<String>? _imageBytes;
  List<String> get imageBytes => _imageBytes ?? const [];
  set imageBytes(List<String>? val) => _imageBytes = val;
  void updateImageBytes(Function(List<String>) updateFn) =>
      updateFn(_imageBytes ??= []);
  bool hasImageBytes() => _imageBytes != null;

  // "fileName" field.
  String? _fileName;
  String get fileName => _fileName ?? '';
  set fileName(String? val) => _fileName = val;
  bool hasFileName() => _fileName != null;

  // "mimeType" field.
  String? _mimeType;
  String get mimeType => _mimeType ?? '';
  set mimeType(String? val) => _mimeType = val;
  bool hasMimeType() => _mimeType != null;

  static CroppedImageDataStruct fromMap(Map<String, dynamic> data) =>
      CroppedImageDataStruct(
        imageBytes: getDataList(data['imageBytes']),
        fileName: data['fileName'] as String?,
        mimeType: data['mimeType'] as String?,
      );

  static CroppedImageDataStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CroppedImageDataStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'imageBytes': _imageBytes,
        'fileName': _fileName,
        'mimeType': _mimeType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imageBytes': serializeParam(
          _imageBytes,
          ParamType.String,
          true,
        ),
        'fileName': serializeParam(
          _fileName,
          ParamType.String,
        ),
        'mimeType': serializeParam(
          _mimeType,
          ParamType.String,
        ),
      }.withoutNulls;

  static CroppedImageDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CroppedImageDataStruct(
        imageBytes: deserializeParam<String>(
          data['imageBytes'],
          ParamType.String,
          true,
        ),
        fileName: deserializeParam(
          data['fileName'],
          ParamType.String,
          false,
        ),
        mimeType: deserializeParam(
          data['mimeType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CroppedImageDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CroppedImageDataStruct &&
        listEquality.equals(imageBytes, other.imageBytes) &&
        fileName == other.fileName &&
        mimeType == other.mimeType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([imageBytes, fileName, mimeType]);
}

CroppedImageDataStruct createCroppedImageDataStruct({
  String? fileName,
  String? mimeType,
}) =>
    CroppedImageDataStruct(
      fileName: fileName,
      mimeType: mimeType,
    );
