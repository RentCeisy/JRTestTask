package net.rentceisy.dao;

import net.rentceisy.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartDaoImpl implements PartDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void createPart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(part);
    }

    @Override
    public void updatePart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part);
    }

    @Override
    public void removePart(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = getPartById(id);
        session.delete(part);
    }

    @Override
    public Part getPartById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = (Part)session.load(Part.class, id);

        return part;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getListPart() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part").list();

        return partList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getListPartOrderByName() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part order by name").list();

        return partList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getListPartOrderByAmount() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part order by amount").list();

        return partList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getListPartOrderByNeeded() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part order by needed desc").list();

        return partList;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> findDetailByName(String name) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Part where name = :name");
        query.setParameter("name", name);
        List<Part> listParts = query.list();
        return listParts;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Part> getPartByNeeded() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Part where needed =: needed");
        query.setParameter("needed", true);
        List<Part> listNeeded = query.list();

        return listNeeded;
    }
}
