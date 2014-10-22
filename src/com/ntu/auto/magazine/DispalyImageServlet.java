package com.ntu.auto.magazine;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

/**
 * Servlet implementation class DispalyImageServlet
 */
@WebServlet(name = "dispalyImageServlet", urlPatterns = { "/dispalyImageServlet" })
public class DispalyImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DispalyImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		InputStream photo = (InputStream)request.getAttribute("photo");
		byte[] bytes;
		if(photo != null){
			try{
			bytes = IOUtils.toByteArray(photo);
			response.setContentType("image/jpg");
			response.setContentLength(bytes.length);
		    response.getOutputStream().write(bytes);
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		    photo.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//request.getSession().removeAttribute("photo");
		bytes = null;
	}
}
