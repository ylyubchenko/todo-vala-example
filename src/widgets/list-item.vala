[GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/list-item.ui")]
public class Todo.ListItem : Gtk.ListBoxRow {
    private const string LIST_ITEM_CSS = """
        checkbutton:checked check {
            background-color: #737373;
            border-color: #999999;
        }

        checkbutton:checked label {
            text-decoration: line-through;
        }
    """;

    construct {
        try {
            var provider = new Gtk.CssProvider();
            provider.load_from_data (LIST_ITEM_CSS);

            var screen = Gdk.Screen.get_default ();
            Gtk.StyleContext.add_provider_for_screen(
                screen,
                provider,
                Gtk.STYLE_PROVIDER_PRIORITY_USER
            );
        } catch (Error e) {
            debug (e.message);
        }
    }
}

