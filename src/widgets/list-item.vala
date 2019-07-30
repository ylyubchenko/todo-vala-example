[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/list-item.ui")]
public class Todo.ListItem : Gtk.ListBoxRow {
    [GtkChild]
    private Gtk.Label label;

    construct {
        debug (label.label);
    }
}

