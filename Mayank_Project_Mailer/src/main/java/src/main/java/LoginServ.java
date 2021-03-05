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

import src.main.java.RegisterDao;

@WebServlet("/welcome")
public class LoginServ extends HttpServlet {
	private static final long serialVersionUID = 1;
//	private RegisterDao loginDao;

	public void init() {
//		loginDao = new RegisterDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			authenticate(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Session session=  HibernateUtil.getSessionFactory().openSession();
            Transaction tx= session.beginTransaction();
            Register user = (Register)session.createQuery("FROM Register WHERE email = :email").setParameter("email", email)
					.uniqueResult();

			if (user != null && user.getPassword().equals(password)){
				
			
//				request.setAttribute("email", user);
		        HttpSession sess = request.getSession();
		        sess.setAttribute("email",user);

				RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
				
				dispatcher.forward(request, response);
				
			} else {
				throw new Exception("Login not successful..");
			}
			tx.commit();
            session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}