

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.DBObject;

/**
 * Servlet implementation class TodoVaccinelistServ
 */
public class TodoVaccinelistServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoVaccinelistServ() {
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
		//System.out.println("Helllo "+usename);
		if (usename == null) {
			response.sendRedirect("loginpage.jsp");
			
		}
		else{
			System.out.println("In Servelet toDoListvaccineCust");
			ToDoList v=new ToDoList();
			List<DBObject> resultSet = v.gettodolist(usename);

			session.setAttribute("searchresults",resultSet);
			response.sendRedirect("displaytoDolistCust.jsp");
		}
	}

}
