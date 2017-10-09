

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginDoctor
 */
@WebServlet("/loginDoctor")
public class loginDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginDoctor() {
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(username+" "+password);
		Doctor a = new Doctor();
		//System.out.println("share");

		int user = a.getDoctor(username, password);
		if(user==1){
			System.out.println("Doctor Loggenin");
			HttpSession session = request.getSession();
			session.setAttribute("uname", username);
			session.setAttribute("pass", password);
			
			response.sendRedirect("VaccinelistCustServ");
			return;
		}
		else
			System.out.println("soorry");
		response.sendRedirect("loginpage.jsp");

	}

}
