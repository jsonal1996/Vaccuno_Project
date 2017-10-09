

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet_SignUpDoctor
 */
@WebServlet("/Servlet_SignUpDoctor")
public class Servlet_SignUpDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_SignUpDoctor() {
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
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		//String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phoneno = request.getParameter("phoneno");
		String location = request.getParameter("location");
		String licenseno = request.getParameter("licenseno");
		String password = request.getParameter("password");
		
		
		

//		if(usertype.equals("doctor")){
		System.out.println(username+" "+name+" "+email+" "+password+"\n");

			Doctor d = new Doctor();
			d.addDoctorDetails(username,name,email,phoneno,location,licenseno,password);
			System.out.println("Hello outside");

			
			/* if(user == NULL){
				request.setAttribute("error","Invalid User name and password or sign up");
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                                                rd.include(request,response); 
			} */
			
			response.sendRedirect("loginpage.jsp");

	}

}
