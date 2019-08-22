public abstract class Todo.Data.GenericDao<TModel> : Object {
    protected Gda.Connection conn;

    protected string conn_str
         = "SQLite://DB_DIR=.;DB_NAME=com.github.undeadspez.todo-vala-example";

    public GenericDao() {
        conn = Gda.Connection.open_from_string (null, conn_str, null, Gda.ConnectionOptions.NONE);
        create_table ();
    }

    public abstract Gee.Collection<TModel> get_all_entities ();

    public abstract TModel get_entity (uint id);

    public abstract void create_entity (TModel entity);

    public abstract void update_entity (TModel entity);

    public abstract void destroy_entity (uint id);

    protected abstract void create_table ();
}

