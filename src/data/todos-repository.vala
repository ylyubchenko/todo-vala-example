using Gda;
using Todo.Models;

namespace Todo.Data
{
    public class TodosRepository : Object, Repository<TodoModel>
    {
        private Connection conn;

        public TodosRepository(Gda.Connection conn)
        {
            this.conn = conn;
        }

        public TodoModel[] GetAll()
            requires (this.conn.is_opened())
        {
            return new TodoModel[] {};
        }

        public TodoModel Get(int id)
            requires (this.conn.is_opened())
        {
            return new TodoModel();
        }

        public void Add(TodoModel model)
            requires (this.conn.is_opened())
        {

        }

        public void Update(TodoModel model)
            requires (this.conn.is_opened())
        {

        }

        public void Delete(int id)
            requires (this.conn.is_opened())
        {

        }
    }
}

