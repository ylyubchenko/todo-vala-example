[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/form.ui")]
public class Todo.Form : Gtk.Box {
    [GtkChild]
    private Gtk.Entry input;

    [GtkChild]
    private Gtk.Button submit;
}

