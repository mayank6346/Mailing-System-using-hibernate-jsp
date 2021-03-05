package src.main.java;

import org.hibernate.Session;
import org.hibernate.Transaction;

import src.main.java.Register;
import src.main.java.HibernateUtil;


public class RegisterDao {

    public void saveUser(Register user) {
        Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.save(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
  
}