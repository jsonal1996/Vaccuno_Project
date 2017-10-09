

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet_AddVaccine
 */
@WebServlet("/Servlet_AddVaccine")
public class Servlet_AddVaccine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet_AddVaccine() {
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
		String name = request.getParameter("vname");
		String cost = request.getParameter("vcost");
		String vendor = request.getParameter("ven");
		String disease = request.getParameter("dise");
		String minNoDoses = request.getParameter("mindos");
		
		System.out.println(name+""+vendor+" "+cost);
		
		

//		if(usertype.equals("doctor")){
			
			Vaccination v = new Vaccination();
			v.addVacc(name,cost,vendor,disease,minNoDoses);

			//HttpSession session = request.getSession();
			/* if(user == NULL){
				request.setAttribute("error","Invalid User name and password or sign up");
					RequestDispatcher rd=request.getRequestDispatcher("profile.jsp");
                                                rd.include(request,response); 
			} */
			
			//session.setAttribute("username", username);
			
			response.sendRedirect("displayVaccine.jsp");
	}

}
