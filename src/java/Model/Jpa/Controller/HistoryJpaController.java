/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Jpa.Controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import Model.Jpa.Account;
import Model.Jpa.Controller.exceptions.NonexistentEntityException;
import Model.Jpa.Controller.exceptions.PreexistingEntityException;
import Model.Jpa.Controller.exceptions.RollbackFailureException;
import Model.Jpa.History;
import Model.Jpa.Product;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;

/**
 *
 * @author INT303
 */
public class HistoryJpaController implements Serializable {

    public HistoryJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(History history) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Account username = history.getUsername();
            if (username != null) {
                username = em.getReference(username.getClass(), username.getUsername());
                history.setUsername(username);
            }
            Product productid = history.getProductid();
            if (productid != null) {
                productid = em.getReference(productid.getClass(), productid.getProductid());
                history.setProductid(productid);
            }
            em.persist(history);
            if (username != null) {
                username.getHistoryList().add(history);
                username = em.merge(username);
            }
            if (productid != null) {
                productid.getHistoryList().add(history);
                productid = em.merge(productid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findHistory(history.getHistoryid()) != null) {
                throw new PreexistingEntityException("History " + history + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(History history) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            History persistentHistory = em.find(History.class, history.getHistoryid());
            Account usernameOld = persistentHistory.getUsername();
            Account usernameNew = history.getUsername();
            Product productidOld = persistentHistory.getProductid();
            Product productidNew = history.getProductid();
            if (usernameNew != null) {
                usernameNew = em.getReference(usernameNew.getClass(), usernameNew.getUsername());
                history.setUsername(usernameNew);
            }
            if (productidNew != null) {
                productidNew = em.getReference(productidNew.getClass(), productidNew.getProductid());
                history.setProductid(productidNew);
            }
            history = em.merge(history);
            if (usernameOld != null && !usernameOld.equals(usernameNew)) {
                usernameOld.getHistoryList().remove(history);
                usernameOld = em.merge(usernameOld);
            }
            if (usernameNew != null && !usernameNew.equals(usernameOld)) {
                usernameNew.getHistoryList().add(history);
                usernameNew = em.merge(usernameNew);
            }
            if (productidOld != null && !productidOld.equals(productidNew)) {
                productidOld.getHistoryList().remove(history);
                productidOld = em.merge(productidOld);
            }
            if (productidNew != null && !productidNew.equals(productidOld)) {
                productidNew.getHistoryList().add(history);
                productidNew = em.merge(productidNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = history.getHistoryid();
                if (findHistory(id) == null) {
                    throw new NonexistentEntityException("The history with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            History history;
            try {
                history = em.getReference(History.class, id);
                history.getHistoryid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The history with id " + id + " no longer exists.", enfe);
            }
            Account username = history.getUsername();
            if (username != null) {
                username.getHistoryList().remove(history);
                username = em.merge(username);
            }
            Product productid = history.getProductid();
            if (productid != null) {
                productid.getHistoryList().remove(history);
                productid = em.merge(productid);
            }
            em.remove(history);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<History> findHistoryEntities() {
        return findHistoryEntities(true, -1, -1);
    }

    public List<History> findHistoryEntities(int maxResults, int firstResult) {
        return findHistoryEntities(false, maxResults, firstResult);
    }

    private List<History> findHistoryEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(History.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public History findHistory(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(History.class, id);
        } finally {
            em.close();
        }
    }

    public int getHistoryCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<History> rt = cq.from(History.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
