

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.DBObject;

/**
 * Servlet implementation class AppointmentRequestServ
 */
public class AppointmentRequestServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentRequestServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
		String usename = (String) session.getAttribute("uname");
		System.out.println("Helllo in thee "+usename);
		if (usename == null) {
			response.sendRedirect("loginpage.jsp");
			return;
			
		}
		else{
			System.out.println("In Servelet Appointment request");
			Appointment a=new Appointment();
			
			List<DBObject> resultSet = a.getAppointment("Minty");

			session.setAttribute("searchresults",resultSet);
			response.sendRedirect("displayAppointment.jsp");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
