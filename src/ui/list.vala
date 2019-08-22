[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/list.ui")]
public class Todo.List : Gtk.ListBox {
    public List() {
        var todo_dao = new Todo.Data.TodoDao ();
        //App exits unexpectedly
        //var todos = todo_dao.get_all_entities ();
        //debug (@"$(todos.size)");
    }
}

