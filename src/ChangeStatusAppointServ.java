

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangeStatusAppointServ
 */
public class ChangeStatusAppointServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeStatusAppointServ() {
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
		String collname=request.getParameter("collname");
		String vname=request.getParameter("vname");
		String dose=request.getParameter("dose");
		System.out.println("Now Doses is "+dose+" vacc name: "+vname);
		HttpSession session=request.getSession();
		session.setAttribute("usname", collname);
		session.setAttribute("vname", vname);

		Appointment v=new Appointment();
		int retu=v.updateStatusApproval(vname, collname);
		if(retu==0){
			session.setAttribute("dose",dose);
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
			out.println("<html>");
	    	out.println("<script type=\"text/javascript\">");
	    	out.println("alert('Approved, Add Appointment Dates');");
	    	out.println("location='displayAppointment.jsp';");
	    	out.println("</script></html>");
		}
		else if(retu==1){
			session.setAttribute("dose",null);
			response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
			out.println("<html>");
	    	out.println("<script type=\"text/javascript\">");
	    	out.println("alert('Already Approved');");
	    	out.println("location='displayAppointment.jsp';");
	    	out.println("</script></html>");
		}
	}

}
