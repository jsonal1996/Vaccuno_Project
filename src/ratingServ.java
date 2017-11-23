import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ratingServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ratingServ() {
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
		HttpSession session=request.getSession();
		/*String rate =request.getParameter("rating");		

		System.out.println("Rating is"+rate);*/

		String name = (String) session.getAttribute("doc");
		String rate =request.getParameter("rating");
		String output = name.substring(0, 1).toUpperCase() + name.substring(1);
		System.out.println("Doc Name "+output);

		System.out.println(name+" "+rate);
		Rating r=new Rating();
		r.addRating(output,rate);
		System.out.println("rating added successfully");
		response.sendRedirect("DoctorDetailServ");
		return;
	}

}