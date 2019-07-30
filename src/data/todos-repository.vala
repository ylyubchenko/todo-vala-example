using Gda;
using Todo.Models;

namespace Todo.Data {
    public class TodosRepository : Object, Repository<TodoModel> {
        private Connection conn;

        private string TABLE_NAME = "todos";

        private const string CREATE_TODOS_TABLE_QUERY = """
            CREATE TABLE IF NOT EXISTS todos (
                id INTEGER PRIMARY KEY NOT NULL,
                text TEXT NOT NULL
            );
        """;

        public TodosRepository (Connection conn) {
            this.conn = conn;
            create_table ();
        }

        public TodoModel[] get_all_entities () requires (this.conn.is_opened ()) {
            var builder = new SqlBuilder (SqlStatementType.SELECT);
            builder.select_add_field ("*", TABLE_NAME, null);

            var statement  = builder.get_statement ();
            var data_model = conn.statement_execute_select (statement, null);

            var todos = new TodoModel[] {};
            var iter  = data_model.create_iter ();

            do {
                var todo  = new TodoModel ();
                todo.Id = iter.get_value_for_field ("id").get_uint ();
                todo.Text = iter.get_value_for_field ("text").get_string ();

                stdout.printf (todo.to_string ());
                todos += todo;
            } while (iter.move_next ());

            return todos;
        }

        public TodoModel get_entity (uint id) requires (this.conn.is_opened ()) {
            var builder = new SqlBuilder (SqlStatementType.SELECT);
            builder.set_where (id);
            builder.select_add_target (TABLE_NAME, null);

            var statement  = builder.get_statement ();
            var data_model = conn.statement_execute_select (statement, null);

            var todo = new TodoModel ();
            var iter = data_model.create_iter ();

            todo.Id   = iter.get_value_for_field ("id").get_uint ();
            todo.Text = iter.get_value_for_field ("text").get_string ();

            return todo;
        }

        public void add_entity (TodoModel model) requires (this.conn.is_opened ()) {
            var builder = new SqlBuilder (SqlStatementType.INSERT);

            var text = Value (typeof (string));
            text.set_string (model.Text);

            builder.add_field_value_as_gvalue ("text", text);

            Set inserted_row;

            var statement  = builder.get_statement ();
            conn.statement_execute_non_select (statement, null , out inserted_row);

            var id = inserted_row.get_holder_value ("id").get_uint ();
            stdout.printf (@"inserted id: $id");
        }

        public void update_entity (TodoModel model) requires (this.conn.is_opened ()) {

        }

        public void delete_entity (uint id) requires (this.conn.is_opened ()) {

        }

        private void create_table () throws Error {
            conn.execute_non_select_command (CREATE_TODOS_TABLE_QUERY);
        }
    }
}


