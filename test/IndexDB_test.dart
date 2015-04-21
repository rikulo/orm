////example "stolen" from http://www.html5rocks.com/en/tutorials/indexeddb/todo/
//import "dart:html";
//import "dart:async";
//import "dart:indexed_db";
//
//IDBDatabase db;
//
//onError(evt) => print(evt);
//
//bool contains(List<String> stores, String name) {
//  for(int j = 0; j < stores.length; ++j) {
//    if (stores[j] == name) {
//      return true;
//    }
//  }
//  return false;
//}
//
//open() {
//  IdbFactory indexedDB = window.indexedDB;
//  IDBRequest req = indexedDB.open("todos");
//  req.on.success.add((evt) {
//    var v = "1.99";
//    db = evt.target.result;
//    Completer completer = new Completer();
//    Future future = completer.future;
//    if (v != db.version) {
//      IDBVersionChangeRequest verreq = db.setVersion(v);
//
//      verreq.on.error.add((evt0) => print(evt0));
//      verreq.on.success.add((evt0) {
//        if (contains(db.objectStoreNames, "todo")) {
//          db.deleteObjectStore("todo");
//        }
//
//        IDBObjectStore store = db.createObjectStore("todo", {"keyPath": "timeStamp"});
//        IDBTransaction trans = verreq.result;
//        trans.on.complete.add((evt1) => init(completer));//getAllTodoItems());
//      });
//    } else {
//      init(completer);//getAllTodoItems();
//    }
//    future.then((val) => getAllTodoItems());
//  });
//
//  req.on.error.add((evt) => onError(evt));
//}
//
//int count = 0;
//
//Future addTodo(String todoText) {
//  IDBTransaction trans = db.transaction(["todo"], "readwrite");
//  IDBObjectStore store = trans.objectStore("todo");
//
//  Map data = {
//    "text" : todoText,
//    "timeStamp" : new Date.now().millisecondsSinceEpoch
//  };
//
//  IDBRequest request = store.put(data);
//
//  Completer completer = new Completer();
//  request.on.success.add((evt) => completer.complete(null));/*getAllTodoItems()*/
//  request.on.error.add((evt) => print("Error Adding: $evt"));
//  return completer.future;
//}
//
//getAllTodoItems() {
//  IDBTransaction trans = db.transaction(["todo"], "readwrite");
//  IDBObjectStore store = trans.objectStore("todo");
//
//  //Get everything in the store
//  IDBKeyRange keyRange = new IDBKeyRange.lowerBound(0);
//  IDBRequest cursorRequest = store.openCursor(keyRange);
//
//  cursorRequest.on.success.add((evt) {
//    var tg = evt.target;
//    IDBCursorWithValue cursor = tg.result;
//    if (cursor == null) {
//      print("-- NO MORE --");
//      return;
//    }
//    print(cursor.value);
//    cursor.continueFunction();
//  });
//
//  cursorRequest.on.error.add((evt) => onError(evt));
//}
//
//void init(Completer completer) {
//  List<Future> futures = new List();
//  for (int j = 0; j < 10; ++j) {
//    futures.add(addTodo("item $j"));
//  }
//  Future alldone = Futures.wait(futures);
//  alldone.then((allfutures) => completer.complete(null));
//}
//
//void main() {
//  open();
//}
