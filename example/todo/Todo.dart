//Stolen example from http://docs.jboss.org/hibernate/orm/4.1/manual/en-US/html_single/#tutorial-firstapp
import "../../lib/orm.dart";
import "dart:async";
//import 'lib/orm.dart';

//@Entity
//@Table(name = "EVENTS")
class Event {
  //@Id
  //@GeneratedValue
  //@Column(name = "EVENT_ID")
  int id;

  String title;

  //@Temporal(TemporalType.TIMESTAMP)
  //@Column(name = "EVENT_DATE")
  DateTime date;

  Event(this.title, this.date);
}

Future<bool> saveEvent(EntityManager em, Transaction tx) {
  return em.persist( new Event("Our very first event!", new DateTime.now()))
    .chain((success) => em.persist( new Event("A follow up event", new DateTime.now())))
    .chain((success) => em.close());
}

Future<List<Event>> getEvents(EntityManager em, EntityTransaction tx) {
  Future<List<Event>> eventsfr = em.createQuery("from Event", "Event").getResultList();
  eventsfr.chain((events) {var results = events; return em.close();})
    .then((success) => );
  return events; //return events in list
}

main() {
  Configuration config =
    new Configuration()
      ..persistenceUnit("TodoDB", properties: {
          "rikulo:orm.dialect" : "rikulo:orm/dialect/SQLite",
          "rikulo:orm.show_sql" : true,
          "rikulo:orm.connection.url" : "Todo",
          "rikulo:orm.SQLite.version" : "1.0",
          "rikulo:orm.SQLite.description" : "Todo Manager",
          "rikulo:orm.SQLite.estimated_size" : 5 * 1024 * 1024});

  Mapping mapping =
    new Mapping()
      ..mapClass("Event",
          [
            const Entity(),
            const Table(name: "EVENTS")
          ],
          {
            "id":
              [
                const Id(),
                const GeneratedValue(),
                const Column(name: "EVENT_ID")
              ],
            "date":
              [
                const Temporal(TemporalType.TIMESTAMP),
                const Column(name: "EVENT_DATE")
              ]
          }
        );

  Future<EntityManagerFactory> emffr =
      Persistence.createEntityManagerFactory("TodoDB", {"rikulo:orm.mapping" : mapping, "rikulo:orm.config" : config});

  //test saveEvent
  emffr
    .chain((emf) => emf.createEntityManager())
    .chain((em) => em.transaction(saveEvent))
    .then((commited) => print("saveEvent success!"));

  //test getEvents
  emffr
    .chain((emf) => emf.createEntityManager())
    .chain((em) => em.transaction(getEvents))
    .then((events) => events.forEach((event) => print("Event (${event.date}) : ${event.title}")));
}
