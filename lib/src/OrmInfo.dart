//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Wed, Aug 15, 2012  04:06:45 PM
// Author: hernichen

part of rikulo_orm;

/** Reflection of an orm.xml file that contains object/relational mapping
 * information.
 */
class OrmInfo {
  Map<String, List<Annotation>> _typesAnnts = new Map();
  Map<String, Map<String, List<Annotation>>> _fieldsAnnts = new Map();

  /** Add mapping of specified class.
   * + [className] - qualified class name (libName.className).
   * + [typeAnnts] - annotations on type/class
   * + [fieldAnnts] - annotation on fields of the specified class in form
   *  of <field-name, list of annotations>
   */
  void mapping(String className, [List<Annotation> typeAnnts,
      Map<String, List<Annotation>> fieldAnnts]) {
    _typesAnnts[className] = new List<Annotation>.from(typeAnnts);

    Map<String, List<Annotation>> tgt = new Map();
    fieldAnnts.forEach((k,v) => tgt[k] = new List<Annotation>.from(v));
    _fieldsAnnts[className] = tgt;
  }

  /** Returns the annotations of the class */
  List<Annotation> getTypeAnnotations(String className)
    => _typesAnnts[className];

  /** Returns the annotations of the fields of the class */
  Map<String, List<Annotation>> getFieldsAnnotations(String className)
    => _fieldsAnnts[className];
}
