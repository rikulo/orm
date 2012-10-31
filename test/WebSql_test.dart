//example "stolen" from http://www.html5rocks.com/en/tutorials/webdatabase/todo/
#import("dart:html");

Database db;

open([Function callback]) {
  int dbSize = 5 * 1024 * 1024; //5MB
  db = window.openDatabase("Todo", "1.0", "Todo manager", dbSize, callback);
}

createTable([Function callback]) {
  db.transaction((tx) {
    tx.executeSql("CREATE TABLE IF NOT EXISTS todo(ID INTEGER PRIMARY KEY ASC, todo TEXT, added_on DATETIME", [], callback);
  });
}

addTodo(String todoText) {
  db.transaction((tx) {
    Date addedOn = new Date.now();
    tx.executeSql("INSERT INTO todo(todo, added_on) VALUES(?,?)",
        [todoText, addedOn],
        onSuccess, onError);
  });
}

onError(tx, ex) => print("There has been an error: ${ex}");

onSuccess(tx, results) {
  getAllTodoItems(loadTodoItems);
  print("--- on Success ---");
}

void getAllTodoItems(Function renderFunc) {
  db.transaction((tx) {
    tx.executeSql("SELECT * FROM todo", [], renderFunc, onError);
  });
}

deleteTodo(int id) {
  db.transaction((tx) {
    tx.executeSql("DELETE FROM todo WHERE ID = ?", [id], onSuccess, onError);
  });
}

loadTodoItems(var tx, var results) {
  for (int j = 0; j < results.rows.length; ++j) {
    var obj = results.rows.item(j);
    print("${obj.ID}, ${obj.todo}, ${obj.added_on}");
  }
}

addTenItems([Function callback]) {
  for(int j = 0; j < 10; j++)
    addTodo("Item $j");
  callback();
}

showFinalResult() {
  print("-- final results --");
  getAllTodoItems(loadTodoItems);
}
void main() {
  open();
  createTable();
  addTenItems;
  showFinalResult();
  //open(createTable(addTenItems(showFinalResult)));
}
