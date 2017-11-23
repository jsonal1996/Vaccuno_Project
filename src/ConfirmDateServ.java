

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
/*import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;*/
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.codejava.email.EmailUtility;

import javax.activation.*;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Servlet implementation class ConfirmDateServ
 */
public class ConfirmDateServ extends HttpServlet {
	private String host;
    private String port;
    private String user;
    private String pass;
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConfirmDateServ() {
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
		String usename=(String) session.getAttribute("usname");
		String vname=(String)session.getAttribute("vname");

		String s=(String) session.getAttribute("dose");
		System.out.println("Now Doses is "+s+" vacc name: "+vname);

		int mindose=Integer.parseInt(s);
		System.out.println("Now Doses is "+mindose+" vacc name: "+vname);

		List<String> dates = new ArrayList<String>();		
		for (int j = 0; j < mindose; j++) {
			dates.add(request.getParameter("date" + j));
			// ...
		}

		Appointment a=new Appointment();
		a.modifyAppointment(usename, vname, dates);
//------------------------------------------------------------------------------------------------------
		//find useremail by username
		Customer c= new Customer();
		String us=c.findEmailbyUsername(usename);
        System.out.println("Email in servlet: "+us);			

		
//---------------------------------------------------------------------------------------------------		
		String username=(String) session.getAttribute("uname");

		String mes;
		mes="This are the details of your Appointment with doctor "+username+" for  "+vname+
				" Vaccine\nDates for your Appointment are: \n";
		
		for (int j = 0; j < mindose; j++) {
			mes+=dates.get(j).toString()+"\n";
			// ...
		}
		String recipient = "sonalj020@gmail.com";
        String subject ="Vaccination Appointment Details";
        String content = mes;
 
        String resultMessage = "";
 
        try {
            EmailUtility.sendEmail(host, port, user, pass, recipient, subject,content);
            resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
        	response.setContentType("text/html");
            PrintWriter out = response.getWriter();
    		out.println("<html>");
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('Mail Sent Successfully for Appointments');");
        	out.println("location='displayAppointment.jsp';");
        	out.println("</script></html>");
        }
		
    	
	
	}
}

