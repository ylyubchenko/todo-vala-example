public class Todo.Data.TodoDao : Todo.Data.GenericDao<Todo.Models.TodoModel> {
    private const string CREATE_TODOS_TABLE_QUERY = """
        CREATE TABLE IF NOT EXISTS todos (
            id INTEGER PRIMARY KEY,
            text TEXT NOT NULL
        );
    """;

    public override Gee.Collection<Todo.Models.TodoModel> get_all_entities ()
        requires (conn.is_opened ()) {
        var builder = new Gda.SqlBuilder (Gda.SqlStatementType.SELECT);
        builder.select_add_field ("*", null, null);
        builder.select_add_target ("todos", null);

        Gda.Statement statement = builder.get_statement ();
        debug (statement.to_sql_extended (conn, null, Gda.StatementSqlFlag.PARAMS_AS_VALUES, null));
        Gda.DataModel data_model = conn.statement_execute_select (statement, null);

        var todos = new Gee.ArrayList<Todo.Models.TodoModel> ();
        var iter = data_model.create_iter ();

        do {
            var todo = new Todo.Models.TodoModel ();
            todo.Id = iter.get_value_for_field ("id").get_uint ();
            todo.Text = iter.get_value_for_field ("text").get_string ();

            debug (todo.to_string ());
            todos.add (todo);
        } while (iter.move_next ());

        debug (@"$(todos.size)");
        return todos;
    }

    public override Todo.Models.TodoModel get_entity (uint id) {
        var builder = new Gda.SqlBuilder (Gda.SqlStatementType.SELECT);
        builder.set_where (id);
        builder.select_add_target ("todos", null);

        Gda.Statement statement = builder.get_statement ();
        debug (statement.to_sql_extended (conn, null, Gda.StatementSqlFlag.PARAMS_AS_VALUES, null));
        Gda.DataModel data_model = conn.statement_execute_select (statement, null);

        var todo = new Todo.Models.TodoModel ();
        var iter = data_model.create_iter ();

        todo.Id = iter.get_value_for_field ("id").get_uint ();
        todo.Text = iter.get_value_for_field ("text").get_string ();

        return todo;
    }

    public override void create_entity (Todo.Models.TodoModel model) {
        var builder = new Gda.SqlBuilder (Gda.SqlStatementType.INSERT);

        var text = Value (typeof (string));
        text.set_string (model.Text);
        builder.add_field_value_as_gvalue ("text", text);

        Gda.Set inserted_row;
        Gda.Statement statement = builder.get_statement ();
        debug (statement.to_sql_extended (conn, null, Gda.StatementSqlFlag.PARAMS_AS_VALUES, null));
        conn.statement_execute_non_select (statement, null , out inserted_row);

        var id = inserted_row.get_holder_value ("id").get_uint ();
        stdout.printf (@"inserted id: $id");
    }

    public override void update_entity (Todo.Models.TodoModel model) {

    }

    public override void destroy_entity (uint id) {

    }

    protected override void create_table () {
        var result = conn.execute_non_select_command (CREATE_TODOS_TABLE_QUERY);
        debug (@"table created: $result");
    }
}

