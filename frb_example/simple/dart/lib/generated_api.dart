// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`.

// ignore_for_file: non_constant_identifier_names, unused_element

import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:typed_data';

import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'generated_wire.dart';

class ExampleApi extends DartRustBridgeBase<ExampleWire> {
  ExampleApi(ExampleWire inner) : super(inner);

  Future<int> simpleAdder({required int a, required int b}) async {
    return execute((port) => inner.wire_simple_adder(port, _api2wire_i32(a), _api2wire_i32(b)), _wire2api_i32);
  }

  Future<int> primitiveTypes(
      {required int myI32, required int myI64, required double myF64, required bool myBool}) async {
    return execute(
        (port) => inner.wire_primitive_types(
            port, _api2wire_i32(myI32), _api2wire_i64(myI64), _api2wire_f64(myF64), _api2wire_bool(myBool)),
        _wire2api_i32);
  }

  Future<String> handleString({required String s}) async {
    return execute((port) => inner.wire_handle_string(port, _api2wire_string(s)), _wire2api_string);
  }

  Future<Uint8List> handleVecU8({required Uint8List v}) async {
    return execute((port) => inner.wire_handle_vec_u8(port, _api2wire_uint_8_list(v)), _wire2api_uint_8_list);
  }

  Future<MySize> handleStruct({required MySize arg, required MySize boxed}) async {
    return execute(
        (port) => inner.wire_handle_struct(port, _api2wire_box_autoadd_my_size(arg), _api2wire_box_my_size(boxed)),
        _wire2api_my_size);
  }

  Future<NewTypeInt> handleNewtype({required NewTypeInt arg}) async {
    return execute(
        (port) => inner.wire_handle_newtype(port, _api2wire_box_autoadd_new_type_int(arg)), _wire2api_new_type_int);
  }

  Future<List<MySize>> handleListOfStruct({required List<MySize> l}) async {
    return execute((port) => inner.wire_handle_list_of_struct(port, _api2wire_list_my_size(l)), _wire2api_list_my_size);
  }

  Future<MyTreeNode> handleComplexStruct({required MyTreeNode s}) async {
    return execute((port) => inner.wire_handle_complex_struct(port, _api2wire_box_autoadd_my_tree_node(s)),
        _wire2api_my_tree_node);
  }

  Future<int> returnErr() async {
    return execute(
        (port) => inner.wire_return_err(
              port,
            ),
        _wire2api_i32);
  }

  Future<int> returnPanic() async {
    return execute(
        (port) => inner.wire_return_panic(
              port,
            ),
        _wire2api_i32);
  }

  // Section: api2wire
  int _api2wire_i32(int raw) {
    return raw;
  }

  int _api2wire_i64(int raw) {
    return raw;
  }

  double _api2wire_f64(double raw) {
    return raw;
  }

  bool _api2wire_bool(bool raw) {
    return raw;
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_string(String raw) {
    return _api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  ffi.Pointer<wire_uint_8_list> _api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

  int _api2wire_u8(int raw) {
    return raw;
  }

  ffi.Pointer<wire_MySize> _api2wire_box_autoadd_my_size(MySize raw) {
    final ptr = inner.new_box_autoadd_my_size();
    _api_fill_to_wire_my_size(raw, ptr.ref);
    return ptr;
  }

  ffi.Pointer<wire_MySize> _api2wire_box_my_size(MySize raw) {
    final ptr = inner.new_box_my_size();
    _api_fill_to_wire_my_size(raw, ptr.ref);
    return ptr;
  }

  ffi.Pointer<wire_NewTypeInt> _api2wire_box_autoadd_new_type_int(NewTypeInt raw) {
    final ptr = inner.new_box_autoadd_new_type_int();
    _api_fill_to_wire_new_type_int(raw, ptr.ref);
    return ptr;
  }

  ffi.Pointer<wire_list_my_size> _api2wire_list_my_size(List<MySize> raw) {
    final ans = inner.new_list_my_size(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_my_size(raw[i], ans.ref.ptr[i]);
    }
    return ans;
  }

  ffi.Pointer<wire_MyTreeNode> _api2wire_box_autoadd_my_tree_node(MyTreeNode raw) {
    final ptr = inner.new_box_autoadd_my_tree_node();
    _api_fill_to_wire_my_tree_node(raw, ptr.ref);
    return ptr;
  }

  ffi.Pointer<wire_list_my_tree_node> _api2wire_list_my_tree_node(List<MyTreeNode> raw) {
    final ans = inner.new_list_my_tree_node(raw.length);
    for (var i = 0; i < raw.length; ++i) {
      _api_fill_to_wire_my_tree_node(raw[i], ans.ref.ptr[i]);
    }
    return ans;
  }

  // Section: api_fill_to_wire

  void _api_fill_to_wire_my_size(MySize apiObj, wire_MySize wireObj) {
    wireObj.width = _api2wire_i32(apiObj.width);
    wireObj.height = _api2wire_i32(apiObj.height);
  }

  void _api_fill_to_wire_new_type_int(NewTypeInt apiObj, wire_NewTypeInt wireObj) {
    wireObj.field0 = _api2wire_i64(apiObj.field0);
  }

  void _api_fill_to_wire_my_tree_node(MyTreeNode apiObj, wire_MyTreeNode wireObj) {
    wireObj.value_i32 = _api2wire_i32(apiObj.valueI32);
    wireObj.value_vec_u8 = _api2wire_uint_8_list(apiObj.valueVecU8);
    wireObj.children = _api2wire_list_my_tree_node(apiObj.children);
  }
}

// Section: dart structs
class MySize {
  final int width;
  final int height;

  MySize({
    required this.width,
    required this.height,
  });
}

class NewTypeInt {
  final int field0;

  NewTypeInt({
    required this.field0,
  });
}

class MyTreeNode {
  final int valueI32;
  final Uint8List valueVecU8;
  final List<MyTreeNode> children;

  MyTreeNode({
    required this.valueI32,
    required this.valueVecU8,
    required this.children,
  });
}

// Section: wire2api
int _wire2api_i32(dynamic raw) {
  return raw as int;
}

int _wire2api_i64(dynamic raw) {
  return raw as int;
}

double _wire2api_f64(dynamic raw) {
  return raw as double;
}

bool _wire2api_bool(dynamic raw) {
  return raw as bool;
}

String _wire2api_string(dynamic raw) {
  return raw as String;
}

Uint8List _wire2api_uint_8_list(dynamic raw) {
  return raw as Uint8List;
}

int _wire2api_u8(dynamic raw) {
  return raw as int;
}

MySize _wire2api_my_size(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 2) throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
  return MySize(
    width: _wire2api_i32(arr[0]),
    height: _wire2api_i32(arr[1]),
  );
}

NewTypeInt _wire2api_new_type_int(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 1) throw Exception('unexpected arr length: expect 1 but see ${arr.length}');
  return NewTypeInt(
    field0: _wire2api_i64(arr[0]),
  );
}

List<MySize> _wire2api_list_my_size(dynamic raw) {
  return (raw as List<dynamic>).map((item) => _wire2api_my_size(item)).toList();
}

MyTreeNode _wire2api_my_tree_node(dynamic raw) {
  final arr = raw as List<dynamic>;
  if (arr.length != 3) throw Exception('unexpected arr length: expect 3 but see ${arr.length}');
  return MyTreeNode(
    valueI32: _wire2api_i32(arr[0]),
    valueVecU8: _wire2api_uint_8_list(arr[1]),
    children: _wire2api_list_my_tree_node(arr[2]),
  );
}

List<MyTreeNode> _wire2api_list_my_tree_node(dynamic raw) {
  return (raw as List<dynamic>).map((item) => _wire2api_my_tree_node(item)).toList();
}