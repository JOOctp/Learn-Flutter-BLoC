class BaseResponse<T> implements Serializable {
  List<T>? data;

  BaseResponse({this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    var data = List<T>.empty(growable: true);
    json['data'].forEach((v) {
      data.add(create(v));
    });

    return BaseResponse<T>(
        data : data,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data;
    return data;
  }
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}