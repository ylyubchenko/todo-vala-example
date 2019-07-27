using Gda;
using Todo.Models;

namespace Todo.Data
{
    public class TodosRepository : Object, Repository<TodoModel>
    {
        private Connection conn;

        private string table_name = "todos";

        public TodosRepository (Gda.Connection conn)
        {
            this.conn = conn;
        }

        public TodoModel[] get_all_entities ()
            requires (this.conn.is_opened ())
        {
            var builder = new SqlBuilder(SqlStatementType.SELECT);
            builder.select_add_field ("*", table_name, null);

            var statement  = builder.get_statement ();
            var data_model = conn.statement_execute_select (statement, null);

            var todos = new TodoModel[] {};
            var iter  = data_model.create_iter ();

            do
            {
                var id   = iter.get_value_for_field ("id").get_uint ();
                var text = iter.get_value_for_field ("text").get_string ();

                var todo = Object.new_with_properties
                (
                    typeof (TodoModel),
                    { "id", "text" },
                    { id, text }
                ) as TodoModel;

                stdout.printf(todo.to_string ());
                todos += todo;
            } while (iter.move_next ());

            return todos;
        }

        public TodoModel get_entity (uint id)
            requires (this.conn.is_opened ())
        {
            var builder = new SqlBuilder(SqlStatementType.SELECT);
            builder.set_where (id);
            builder.select_add_target (table_name, null);

            var statement  = builder.get_statement ();
            var data_model = conn.statement_execute_select (statement, null);

            var todo = new TodoModel();
            var iter = data_model.create_iter ();

            todo.Id   = iter.get_value_for_field ("id").get_uint ();
            todo.Text = iter.get_value_for_field ("text").get_string ();

            return todo;
        }

        public void add_entity (TodoModel model)
            requires (this.conn.is_opened ())
        {
            var builder = new SqlBuilder(SqlStatementType.INSERT);

            var text = new Value (typeof (string));
            text.set_string (model.Text);

            builder.add_field_value_as_gvalue ("text", text);

            Set inserted_row;

            var statement  = builder.get_statement ();
            conn.statement_execute_non_select (statement, null , out inserted_row);

            var id = inserted_row.get_holder_value("+0").get_uint();
            stdout.printf (@"inserted id: $id");
        }

        public void update_entity (TodoModel model)
            requires (this.conn.is_opened ())
        {

        }

        public void delete_entity (uint id)
            requires (this.conn.is_opened ())
        {

        }
    }
}

