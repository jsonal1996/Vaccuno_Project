

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginCustomer
 */
@WebServlet("/loginCustomer")
public class loginCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		System.out.println(username+" "+password);
	
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
		Customer a = new Customer();
		System.out.println("share");

		int user = a.getCustomer(username, password);
		if(user==1){
			System.out.println("User Loggenin");
			HttpSession session = request.getSession();
			session.setAttribute("uname", username);
			session.setAttribute("pass", password);
			
			response.sendRedirect("VaccinelistCustServ");
			return;
			//response.sendRedirect("displayvaccineCust.jsp");
		}
		else
			System.out.println("soorry");
		response.sendRedirect("loginpage.jsp");

	}

}
