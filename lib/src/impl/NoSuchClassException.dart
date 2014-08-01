//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Mon, Sep 03, 2012  13:02:31 PM
// Author: hernichen

part of rikulo_orm_impl;

/** Exception thrown because of non-existing class */
class NoSuchClassException implements Exception {
  final msg;
  const NoSuchClassException([this.msg]);
}
