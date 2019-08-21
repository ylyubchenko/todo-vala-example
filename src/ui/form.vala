[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/form.ui")]
public class Todo.Form : Gtk.Box {
    public signal void submitted(string text);

    [GtkChild]
    private Gtk.Entry input;

    [GtkCallback]
    private void submit_clicked() {
        submitted (input.text);
        input.text = "";
    }
}

