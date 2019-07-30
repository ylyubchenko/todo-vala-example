namespace Todo.Data {
    public interface Repository<T> : Object {
        public abstract T[] get_all_entities ();

        public abstract T get_entity (uint id);

        public abstract void add_entity (T entity);

        public abstract void update_entity (T entity);

        public abstract void delete_entity (uint id);
    }
}

