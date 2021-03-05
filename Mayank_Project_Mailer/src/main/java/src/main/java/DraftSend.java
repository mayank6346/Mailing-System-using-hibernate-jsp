package src.main.java;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import  src.main.java.RegisterDao;
import src.main.java.Register;


@WebServlet("/draftsending")
public class DraftSend extends HttpServlet {
    private static final long serialVersionUID = 1 ;
//    private MailsDao userDao;

    public void init() {
//        userDao = new MailsDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        composemail(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("draft.jsp");
    }

    private void composemail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    
    {
    	try {
    		
//    		HttpSession ss=request.getSession();
    		
            int id =Integer.parseInt(request.getParameter("draftbtnsend"));
            String cc = request.getParameter("cc");
            String bcc = request.getParameter("bcc");
            String message = request.getParameter("message");
            String to = request.getParameter("to");
            String frm = request.getParameter("frm");


System.out.println(to +"hi");
System.out.println(message+"2");
System.out.println(id);

              Mails user = new Mails();
            user.setTo(to);
            user.setCc(cc);
            user.setBcc(bcc);
            user.setMessage(message);
            user.setFrom(frm);
            Draft user2= new Draft();
            user2.setId(id);
//            
            
            Session session=  HibernateUtil.getSessionFactory().openSession();
            Transaction tx= session.beginTransaction();
            
            Query q= session.createQuery("FROM Register WHERE email = :from").setParameter("from", frm);
            System.out.println(q.toString());
             Register c=(Register)q.uniqueResult();
//             System.out.println(c);
            if(c!=null) {       
////            	System.out.println(frm);
            	session.save(user);
            	session.delete(user2);

                tx.commit();
                session.close();
                RequestDispatcher dispatcher = request.getRequestDispatcher("draft.jsp");
                dispatcher.forward(request, response);
            }
            else {
            	System.out.println("wrong entry");
            	 RequestDispatcher dispatcher = request.getRequestDispatcher("draft.jsp");
                 dispatcher.forward(request, response);
            }
//            
//            
            
           
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
}