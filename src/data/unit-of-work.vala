using Gda;

namespace Todo.Data {
    public class UnitOfWork : Object {
        private string conn_str
             = "SQLite://DB_DIR=.;DB_NAME=com.github.undeadspez.todo-vala-example";

        private Connection conn;

        public Todo.Data.TodosRepository todos_repository { get; construct; }

        construct {
            try {
                conn = Connection.open_from_string (null, conn_str, null, ConnectionOptions.NONE);
                todos_repository = new Todo.Data.TodosRepository (conn);
            } catch (Error e) {
                debug (e.message);
            }
        }
    }
}

