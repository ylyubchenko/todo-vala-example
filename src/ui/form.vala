[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/form.ui")]
public class Todo.Form : Gtk.Box {
    //public signal void submitted(string text);

    [GtkChild]
    private Gtk.Entry input;

    [GtkCallback]
    private void submit_clicked() {
        //submitted (input.text);
        var todo = new Todo.Models.TodoModel ();
        todo.Text = input.text;

        var todo_dao = new Todo.Data.TodoDao ();
        todo_dao.create_entity (todo);

        debug ("Todo created");
        input.text = "";
    }
}

