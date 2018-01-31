using datos.db;
using datos.Objetos;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using servicios.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace servicios.implementaciones.facturacion
{
    public class Repo<TEntity, TKey> : IRepo<TEntity, TKey> where TEntity : Base<TKey>
    {
        protected FacturacionDbContext _context { get; set; }
        protected DbSet<TEntity> _dbSet { get; set; }

        public Repo(FacturacionDbContext context)
        {
            _context = context;
            _dbSet = _context.Set<TEntity>();
        }

        public ICollection<TEntity> Read()
        {
            
            return _dbSet.Where(e => e.EsActivo).ToList();
        }

        public Task<ICollection<TEntity>> ReadAsync()
        {
            return Task.Factory.StartNew(Read);
        }

        public TEntity Read(TKey key)
        {
            var mentity = _dbSet.Find(key);
            return (mentity != null && mentity.EsActivo) ? mentity : null;
        }

        public Task<TEntity> ReadAsync(TKey key)
        {
            return Task.Factory.StartNew(() => Read(key));
        }

        public TEntity Create(TEntity entity)
        {
            entity.EsActivo = true;
            entity.FechaModificaion = DateTime.Now;
            entity.FechaAlta = DateTime.Now;
            return _dbSet.Add(entity).Entity;
        }

        public Task<TEntity> CreateAsync(TEntity entity)
        {
            return Task.Factory.StartNew(() => Create(entity));
        }

        public void Create(ICollection<TEntity> entities)
        {
            _dbSet.AddRange(entities);
        }

        public EntityEntry<TEntity> Update(TEntity entity)
        {
            entity.FechaModificaion = DateTime.Now;
            return _dbSet.Update(entity);
        }

        public Task<EntityEntry<TEntity>> UpdateAsync(TEntity entity)
        {
            return Task.Factory.StartNew(() => Update(entity));
        }

        public void Update(ICollection<TEntity> entities)
        {
            _dbSet.UpdateRange(entities);
        }

        public EntityEntry<TEntity> Remove(TEntity entity, bool softDelete = true)
        {
            if (softDelete)
            {
                entity.EsActivo = false;
                return Update(entity);
            }
            else
            {
                return _dbSet.Remove(entity);
            }
        }

        public EntityEntry<TEntity> Remove(TKey key, bool softDelete = true)
        {
            var mentity = Read(key);
            return Remove(mentity, softDelete);
        }

        public Task<EntityEntry<TEntity>> RemoveAsync(TEntity entity, bool softDelete = true)
        {
            return Task.Factory.StartNew(() => Remove(entity, softDelete));
        }

        public Task<EntityEntry<TEntity>> RemoveAsync(TKey key, bool softDelete = true)
        {
            return Task.Factory.StartNew(() => Remove(key, softDelete));
        }

        public void Remove(ICollection<TEntity> entities)
        {
            _dbSet.RemoveRange(entities);
        }

        public int Complete()
        {
            return _context.SaveChanges();
        }

        public Task<int> CompleteAsync()
        {
            return Task.Factory.StartNew(Complete);
        }

        public bool Any(TKey key)
        {
            return _dbSet.Any(e => e.Id.Equals(key));
        }

        public TEntity Search(string expression)
        {
            throw new NotImplementedException();
        }
    }
}
