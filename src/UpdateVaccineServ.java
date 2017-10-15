

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateVaccineServ
 */
public class UpdateVaccineServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVaccineServ() {
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
		response.setContentType("text/html");
		String newcost=request.getParameter("newcost");
		String name=request.getParameter("check");
		PrintWriter out = response.getWriter();
		System.out.println("Heello"+newcost);
		if(newcost==""){
			out.println("<script type='text/javascript'>");
			out.println("alert('Enter new cost to be updated');");
			out.println("window.location.href = 'VaccinelistServ';");
			out.println("</script>");
			
		}
		else{
			Vaccination v=new Vaccination();
			v.updatevaccine(newcost, name);
			
	    	out.println("<script type=\"text/javascript\">");
	    	out.println("alert('Vaccine Updated');");
	    	//out.println("location='loginpage.jsp';");
	    	out.println("</script>");
			response.sendRedirect("VaccinelistServ");
			return;
			
		}
	}

}
