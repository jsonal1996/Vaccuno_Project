

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ServletSignUpCustomer
 */
@WebServlet("/ServletSignUpCustomer")
public class ServletSignUpCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSignUpCustomer() {
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
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String phoneno = request.getParameter("phoneno");
		String email = request.getParameter("email");
		String location = request.getParameter("loc");
		String password = request.getParameter("password");
		
		
		

//		if(usertype.equals("doctor")){
		System.out.println(username+" "+name+" "+email+" "+password+"\n");

			Customer c = new Customer();
			c.addCustDetails(username, name,age,sex,phoneno,email,password,location);

			/* if(user == NULL){
				request.setAttribute("error","Invalid User name and password or sign up");
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                                                rd.include(request,response); 
			} */
			
			response.sendRedirect("loginpage.jsp");

	
	}

}
