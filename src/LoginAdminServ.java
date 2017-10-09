

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginAdminServ
 */
@WebServlet("/LoginAdminServ")
public class LoginAdminServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdminServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String username=request.getParameter("uname");
		String password=request.getParameter("pword");
		System.out.println(username+" "+password);
		System.out.println("share");

		Admin a = new Admin();
		System.out.println("share");

		int user = a.getAdmin(username, password);
		if(user==1){
			System.out.println("Admin Loggenin");
			HttpSession session = request.getSession();
			session.setAttribute("uname", username);
			session.setAttribute("pass", password);
			
			response.sendRedirect("VaccinelistServ");
			return;
			
		}
		else
			System.out.println("soorry");
		response.sendRedirect("loginpage.jsp");

	}

}
