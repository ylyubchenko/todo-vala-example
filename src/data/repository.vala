namespace Todo.Data
{
    public interface Repository<T> : Object
    {
        public abstract T[] GetAll();

        public abstract T Get(int id);

        public abstract void Add(T entity);

        public abstract void Update(T entity);

        public abstract void Delete(int id);
    }
}

