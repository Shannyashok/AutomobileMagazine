package com.ntu.auto.magazine;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntu.auto.magazine.dao.AutomobileDao;
import com.ntu.auto.magazine.dao.AutomobileDaoImpl;
import com.ntu.auto.magazine.model.Advertisement;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet(name = "adminLogin", urlPatterns = { "/adminLogin" })
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("adminLogin") == null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
			dispatcher.forward(request, response);
		}else{
			AutomobileDao automobileDao = new AutomobileDaoImpl();
			List<Advertisement> advList = automobileDao.getAllAdvertisements();
			request.setAttribute("advList", advList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("adminPage.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user");
		String password = request.getParameter("pwd");
		RequestDispatcher dispatcher = null;
		if(userId != null && password !=null){
			if("admin".equals(userId) && "password".equals(password)){
				AutomobileDao automobileDao = new AutomobileDaoImpl();
				List<Advertisement> advList = automobileDao.getAllAdvertisements();
				request.setAttribute("advList", advList);
				request.getSession().setAttribute("adminLogin", "admin");
				dispatcher = request.getRequestDispatcher("adminPage.jsp");
				dispatcher.forward(request, response);
			}else{
				request.setAttribute("msg", "User Id / Password is invalid");
				dispatcher = request.getRequestDispatcher("adminLogin.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}
