using datos.Objetos;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace servicios.interfaces
{
    public interface IRepo<TEntity, TKey> where TEntity : Base<TKey>
    {
        //Create Methods
        TEntity Create(TEntity entity);
        void Create(ICollection<TEntity> entities);
        Task<TEntity> CreateAsync(TEntity entity); //Async

        //Read Methods
        ICollection<TEntity> Read();
        TEntity Read(TKey key);
        Task<ICollection<TEntity>> ReadAsync(); //Async
        Task<TEntity> ReadAsync(TKey key); //Async

        //Update Methods
        EntityEntry<TEntity> Update(TEntity entity);
        Task<EntityEntry<TEntity>> UpdateAsync(TEntity entity); //Async
        void Update(ICollection<TEntity> entities);

        //Remove Methods
        EntityEntry<TEntity> Remove(TEntity entity, bool softDelete = true);
        EntityEntry<TEntity> Remove(TKey key, bool softDelete = true);
        Task<EntityEntry<TEntity>> RemoveAsync(TEntity key, bool softDelete = true); //Async
        Task<EntityEntry<TEntity>> RemoveAsync(TKey key, bool softDelete = true); //Async
        void Remove(ICollection<TEntity> entities);

        //Search Methods
        TEntity Search(string expression);

        // Any Method
        bool Any(TKey key);

    }    
}
