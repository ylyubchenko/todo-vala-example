[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/list-item.ui")]
public class Todo.ListItem : Gtk.ListBoxRow {
    [GtkChild]
    private Gtk.CheckButton check_button;

    public ListItem(string label) {
        check_button = new Gtk.CheckButton ();
        check_button.label = label;
    }
}

