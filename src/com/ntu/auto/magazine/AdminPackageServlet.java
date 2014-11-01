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
import com.ntu.auto.magazine.model.Package;

/**
 * Servlet implementation class AdminPackageServlet
 */
@WebServlet(name = "adminPackage", urlPatterns = { "/adminPackage" })
public class AdminPackageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPackageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int pkgId = Integer.valueOf(request.getParameter("pkgId")!=null ?request.getParameter("pkgId") :"-1").intValue();
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		if("edit".equals(action)){
			Package pkg = automobileDao.getPackageById(pkgId);
			request.setAttribute("pkg", pkg);
		}
		if("delete".equals(action)){
			automobileDao.deletePackage(pkgId);
			request.setAttribute("msg", "Package expired successfully");
		}
		List<Package> pkgs = automobileDao.getAllPackages();
		request.setAttribute("pkgs", pkgs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminPackage.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pkgId = Integer.valueOf(request.getParameter("pkgId")!=null ?request.getParameter("pkgId") :"-1").intValue();
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		Package pkg = new Package();
		boolean isNew = false;
		if(pkgId != -1){
			if(pkgId == 0){
				isNew = true;
			}
			pkg.setPackageId(pkgId);
			pkg.setCode(request.getParameter("code"));
			pkg.setName(request.getParameter("name"));
			pkg.setPrice(Double.valueOf(request.getParameter("price")).doubleValue());
			pkg.setNote(request.getParameter("note"));
			if(isNew){
				automobileDao.addPackage(pkg);
				request.setAttribute("msg", "Package created successfully");
			}else{
				automobileDao.updatePackage(pkg);
				request.setAttribute("msg", "Package updated successfully");
			}
		}
		List<Package> pkgs = automobileDao.getAllPackages();
		request.setAttribute("pkgs", pkgs);
		request.setAttribute("pkg", pkg);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminPackage.jsp");
		dispatcher.forward(request, response);
	}

}
