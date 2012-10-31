//Copyright (C) 2012 Potix Corporation. All Rights Reserved.
//History: Thu, Mar 23, 2012 03:45:13 PM
// Author: henrichen

class PersistenceProviderImpl implements PersistenceProvider {
  static String _PROVIDER_NAME = "rikulo:orm/spi/impl.PersistenceProviderImpl";

  Future<EntityManagerFactory> createContainerEntityManagerFactory(
      PersistenceUnitInfo info, Map properties) {
    Map myprops = properties != null ? new Map.from(properties) : new Map();

    return _createEntityManagerFactory0(info, myprops);
  }

  Future<EntityManagerFactory> createEntityManagerFactory(
      [String name, Map properties]) {
    Map myprops = properties != null ? new Map.from(properties) : new Map();

    //1. get persistence info
    PersistenceInfo pinfo = _getPersistenceInfo(myprops);

    //2. locate the persistence unit with the name and matched provider class
    List<PersistenceUnitInfo> uinfos = pinfo.getPersistenceUnitInfos();
    if (name == null && uinfos.length > 1)
      throw const PersistenceException(
          "PersistenceUnit name is not provided and there are more "
          "than one PersistenceUnits found; don't know which one to use.");
    for (PersistenceUnitInfo uinfo in uinfos) {
      if (name == null || name == uinfo.getPersistenceUnitName()) {
        if (_isProvider(uinfo, myprops))
          return _createEntityManagerFactory0(uinfo, myprops);
      }
    }

    return null; //none was found!
  }

  //TODO(henri)
  ProviderUtil getProviderUtil() {
    throw const NotImplementedException("getProviderUtil");
  }

  Future<EntityManagerFactory> _createEntityManagerFactory0(
      PersistenceUnitInfo uinfo, Map properties) {
    ORMInfo oinfo = _getOrmInfo(properties);
    Metamodel mmodel = new MetamodelImpl(uinfo, oinfo);
    Completer<EntityManagerFactory> cmpl = new Completer();
    cmpl.complete(new EntityManagerFactoryImpl(uinfo, mmodel, properties));
    return cmpl.future;
  }

  bool _isProvider(PersistenceUnitInfo uinfo, Map properties) {
    //information in properties has higher priority
    String pclass = properties == null ? null : properties["rikulo:orm.provider"];
    if (pclass == null)
      pclass = uinfo.getPersistenceProviderClassName();
    if (pclass != null)
      pclass = pclass.trim();

    return pclass == null || _PROVIDER_NAME == pclass;
  }

  //read persistence.xml and properties to get the PersistenceInfo.
  //TODO(henri) : persistence.xml is not implemented yet. Future?
  PersistenceInfo _getPersistenceInfo(Map myprops) {
    PersistenceInfo pinfo = myprops == null ?
        null : myprops[Persistence.PERSISTENCE_INFO];

    if (pinfo == null)
      throw const PersistenceException("Must specify rikulo:orm.PersistenceInfo");

    return pinfo;
  }

  //read orm.xml to get the mapping information and return Metamodal.
  //TODO(henir): orm.xml is not implemented yet. Future?
  ORMInfo _getOrmInfo(Map myprops) {
    ORMInfo minfo = myprops == null ?
        null : myprops[Persistence.ORM_INFO];

    if (minfo == null)
      throw const PersistenceException("Must specify rikulo:orm.OrmInfo");

    return minfo;
  }
}
