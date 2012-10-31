/** For class: specifies that the class is a metamodel class that represents
 * the entity, mapped superclass, or embeddable class designated by the value
 * element.
 */
//@Target(value:"TYPE")
class StaticMetamodel extends Annotation {
  final String className;

  const StaticMetamodel(this.className);
}