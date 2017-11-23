

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BookAppointmentServ
 */
public class BookAppointmentServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppointmentServ() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession session=request.getSession();
		String usename = (String) session.getAttribute("uname");
		
		String name = request.getParameter("check");
		String cost = request.getParameter("check1");
		String vendor = request.getParameter("check2");
		String disease = request.getParameter("check3");
		String minNoDoses = request.getParameter("check4");
		
		session.setAttribute("name", name);
		session.setAttribute("cost", cost);
		session.setAttribute("vendor", vendor);
		session.setAttribute("disease", disease);
		session.setAttribute("minNoDoses", minNoDoses);
		Appointment v=new Appointment();
		int retu=v.updateStatusPendApproval(name, usename);
		System.out.println("In Servelet BookAppointment");

		response.sendRedirect("DoctorDetailServ");
		return;
		
	}

}
