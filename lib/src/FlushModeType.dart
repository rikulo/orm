//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Tue, Aug 14, 2012  11:28:23 AM
// Author: hernichen

/** Flush mode decides when to flush entities into db */
class FlushModeType extends Enum {
  /** (default) flushing entity to db at query execution. */
  static final FlushModeType AUTO = const FlushModeType("AUTO", 0);
  /** flushing entity to db at transaction commit. */
  static final FlushModeType COMMIT = const FlushModeType("COMMIT", 1);

  const FlushModeType(String name, int ordinal) : super(name, ordinal);
}