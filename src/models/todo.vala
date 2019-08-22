public class Todo.Models.TodoModel : Object {
    public uint Id { get; set; }

    public string Text { get; set; }

    public string to_string () {
        return @"id: $Id, text: $Text";
    }
}

