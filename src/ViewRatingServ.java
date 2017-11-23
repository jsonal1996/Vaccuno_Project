import java.io.IOException;
import java.io.PrintWriter;
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
public class ViewRatingServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewRatingServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");

		HttpSession session=request.getSession();
		String dname = (String) session.getAttribute("uname");
        String output = dname.substring(0, 1).toUpperCase() + dname.substring(1);
		System.out.println("Doc Name "+output);

		Rating re=new Rating();
		float r = re.getRating(output);
		System.out.println("Rating "+r);
		PrintWriter out = response.getWriter();

		session.setAttribute("rate",r);
		out.println("<script type=\"text/javascript\">");
    	out.println("alert('Your Rating is " + r + "/5')");
		out.println("window.location.href = 'AppointmentRequestServ';");
		out.println("</script>");
		//response.sendRedirect("displayAppointment.jsp");
		return;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
		