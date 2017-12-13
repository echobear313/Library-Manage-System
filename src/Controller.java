import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Class <b>Controller</b> 
 * Super class for all controller objects used in the CTE Library.
 * This provides a standard error redirect and doGet method that 
 * each controller used in the library may inherit.
 *
 * @author CTE
 * @version 1.0
 */
public class Controller extends HttpServlet {
    
    /**
     * Init method called by the servlet container.
     * @param conf ServletConfig object supplied by servlet container.
     * @throws ServletException
     */
    public void init(ServletConfig conf) throws ServletException 
    {
	super.init(conf);
    }
    
    /**
     * doGet method handles all get requests as post requests.
     * @param req HttpServletRequest servlet object request
     * @param res HttpServletResponse servlet object response
     * @throws ServletException.
     * @throws IOException.
     */
    public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
     {
	 doPost(req, res);
     }
    
    /**
     * sendErrorRedirect method sends errors to the library error page.
     * @param request HttpServletRequest servlet object request
     * @param response HttpServletResponse servlet object response
     * @param t Throwable exception to display.
     */
    protected void sendErrorRedirect(HttpServletRequest request,
				     HttpServletResponse response, Throwable t) 
    {
	// Forwards an exception to the error page.
	try 
	    {
		// Set the error attribute.
		request.getSession().setAttribute("jspException", t);
		response.sendRedirect("error.jsp");
		return;
	    } 
	catch (Exception e) 
	    {
		// Still need to catch an expception if the sendRedirect fails.
		e.printStackTrace();
	    }
    }
}


