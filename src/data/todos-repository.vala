using Gda;
using Todo.Models;

namespace Todo.Data
{
    public class TodosRepository : Object, Repository<TodoModel>
    {
        private Connection conn;

        public TodosRepository (Gda.Connection conn)
        {
            this.conn = conn;
        }

        public TodoModel[] get_all_entities ()
            requires (this.conn.is_opened ())
        {
            return new TodoModel[] {};
        }

        public new TodoModel get_entity (int id)
            requires (this.conn.is_opened ())
        {
            return new TodoModel();
        }

        public void add_entity (TodoModel model)
            requires (this.conn.is_opened ())
        {

        }

        public void update_entity (TodoModel model)
            requires (this.conn.is_opened ())
        {

        }

        public void delete_entity (int id)
            requires (this.conn.is_opened ())
        {

        }
    }
}

