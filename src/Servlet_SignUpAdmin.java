

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet_SignUpAdmin
 */
@WebServlet("/Servlet_SignUpAdmin")
public class Servlet_SignUpAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_SignUpAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("Hell0");
		String username = request.getParameter("un");
		String name = request.getParameter("fn");
		String email = request.getParameter("emai");
		String password = request.getParameter("pass");
		
			System.out.println(username+" "+name+" "+email+" "+password+"\n");
			Admin a = new Admin();
			a.addAdmin(username,name,email,password);
			System.out.println("Hello outside");
			/*HttpSession session = request.getSession();
			/* if(user == NULL){
				request.setAttribute("error","Invalid User name and password or sign up");
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                                                rd.include(request,response); 
			} 
			
			session.setAttribute("username", username);*/
			
			response.sendRedirect("loginpage.jsp");
	
	}

}
