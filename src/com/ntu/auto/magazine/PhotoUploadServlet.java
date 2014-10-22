package com.ntu.auto.magazine;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ntu.auto.magazine.dao.AutomobileDao;
import com.ntu.auto.magazine.dao.AutomobileDaoImpl;

/**
 * Servlet implementation class PhotoUploadServlet
 */
@WebServlet(name = "photoUploadServlet", urlPatterns = { "/photoUploadServlet" })
public class PhotoUploadServlet extends HttpServlet {
	private static final String IMAGE_UPLOAD_DIRECTORY =  "uploadPhotos";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhotoUploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("photoUpload.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean uploadStatus = true;
		if(ServletFileUpload.isMultipartContent(request)){
			AutomobileDao automobileDao = new AutomobileDaoImpl();
			long advId = automobileDao.getNextAdvId();
			ServletFileUpload uploader = null;
			DiskFileItemFactory fileFactory = new DiskFileItemFactory();
	        File filesDir = new File(request.getServletContext().getRealPath("/") + IMAGE_UPLOAD_DIRECTORY + File.separator + Long.valueOf(advId).toString());
	        if(!filesDir.exists()){
	        	filesDir.mkdir();
	        }
	        fileFactory.setRepository(filesDir);
	        uploader = new ServletFileUpload(fileFactory);
	        int counter = 1;
			try{
				List<FileItem> fileItemsList = uploader.parseRequest(request);
				Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
				while(fileItemsIterator.hasNext()){
					FileItem fileItem = fileItemsIterator.next();
	                String extn =".png";
	                if(fileItem.getContentType().contains("jpeg")){
	                	extn=".jpg";
	                }
	                if(fileItem.getContentType().contains("gif")){
	                	extn=".gif";
	                }
	                File file = new File(request.getServletContext().getRealPath("/") + IMAGE_UPLOAD_DIRECTORY+File.separator+Long.valueOf(advId).toString()+File.separator+Integer.valueOf(counter).toString()+extn);
	                if(file.exists()){
	                	file.delete();
	                }
	                fileItem.write(file);
	                counter++;
				}
			}catch(Exception e){
				e.printStackTrace();
				uploadStatus = false;
			}
		}
		if(uploadStatus){
			request.setAttribute("msg", "Photo Uploaded Successfully");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("photoUpload.jsp");
		dispatcher.forward(request, response);
	}
}
