package sc.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sc.entity.CareContent;
import sc.it.ContentDao;

/**
 * Servlet implementation class ContentQueryConroller
 */
@WebServlet("/ContentQueryConroller")
public class ContentQueryConroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentQueryConroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String flag = request.getParameter("flag");
		ContentDao cd = new ContentDao();
		
		if(id!=null&&!id.equals("")) {
			CareContent c = cd.quaryByID(id);
			System.out.println(c);
			
			ArrayList<CareContent> CareContents = new ArrayList<>();
			CareContents.add(c);
			request.setAttribute("CareContent", CareContents);
		}else {
			ArrayList<CareContent> CareContents = cd.queryAll();
			request.setAttribute("CareContent", CareContents);
		}
		if(flag == null) {
			request.getRequestDispatcher("/query.jsp").forward(request,response);
		}else if(flag.contentEquals("update")){
			request.getRequestDispatcher("/updateCareContent.jsp").forward(request,response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
