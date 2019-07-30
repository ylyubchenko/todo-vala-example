using Gtk;

namespace Todo {
    [GtkTemplate (ui = "/com/github/undeadspez/vala-todo-example/ui/form.ui")]
    public class Form : Box {
        public signal void submitted(string text);

        [GtkChild]
        private Entry input;

        [GtkChild]
        private Button submit;

        [GtkCallback]
        private void submit_clicked() {
            submitted (input.text);
            input.text = "";
        }
    }
}

