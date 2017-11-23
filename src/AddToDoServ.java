

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.DBObject;

/**
 * Servlet implementation class AddToDoServ
 */
public class AddToDoServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToDoServ() {
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
		String usename = (String) session.getAttribute("uname");
		
		String name = request.getParameter("check");
		String cost = request.getParameter("check1");
		String vendor = request.getParameter("check2");
		String disease = request.getParameter("check3");
		String minNoDoses = request.getParameter("check4");
		

		ToDoList v = new ToDoList();
		v.addVaccTodoList(usename, name, cost, vendor, disease, minNoDoses);
		/*List<DBObject> resultSet = v.gettodolist(usename);
		session.setAttribute("searchresults",resultSet);
		
		
		response.sendRedirect("TodoVaccinelistServ");*/
		response.sendRedirect("displayvaccineCust.jsp");
		return;
		
		
	}

}
