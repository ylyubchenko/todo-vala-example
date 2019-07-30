public class Todo.Data.UnitOfWork : Object {
    private string conn_str
         = "SQLite://DB_DIR=.;DB_NAME=com.github.undeadspez.todo-vala-example";

    private Gda.Connection conn;

    public Todo.Data.TodosRepository todos_repository { get; construct; }

    construct {
        try {
            conn = Gda.Connection.open_from_string(null, conn_str, null, Gda.ConnectionOptions.NONE);
            todos_repository = new Todo.Data.TodosRepository (conn);
        } catch (Error e) {
            debug (e.message);
        }
    }
}

