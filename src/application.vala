public class Todo.Application : Gtk.Application {
    private Todo.Window window;

    internal Application(string? application_id, ApplicationFlags flags) {
        Object(
            application_id: application_id,
            flags: flags
        );
    }

    protected override void activate() {
        var screen = Gdk.Screen.get_default ();
		var provider = load_css ("styles.css");
		Gtk.StyleContext.add_provider_for_screen (
		    screen,
		    provider,
		    Gtk.STYLE_PROVIDER_PRIORITY_USER
		);

		if (window == null) {
			window = new Todo.Window (this);
		}
		window.present ();
    }

    private static Gtk.StyleProvider load_css (string css) {
        var provider = new Gtk.CssProvider ();
		provider.load_from_resource (@"/com/github/undeadspez/vala-todo-example/$css");
		return provider;
    }
}
