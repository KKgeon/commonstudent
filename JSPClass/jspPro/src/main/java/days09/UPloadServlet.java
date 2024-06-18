package days09;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


//@WebServlet("/UPloadServlet")
public class UPloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UPloadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	//파일 첨부 : post 요청
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<body>");
		
		//첨부파일 1개 :  request.getPart(String name);
		Collection<Part> parts = request.getParts();
		
		String contentType =  request.getContentType();
		if (contentType!=null 
				&& contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(request,out);
		} else {
			out.print("> multipart 아니다.");
		}
		
		
		out.print(contentType);
		
		out.print("</html>");
		out.print("</body>");
	}//dopost

	
	private void printPartInfo(HttpServletRequest request
	         , PrintWriter out) throws IOException, ServletException {
	       
	      Collection<Part> parts = request.getParts();
	      
	      for (Part part : parts) {
	         
	         out.print("<br> name : " + part.getName());
	         
	         String contentType = part.getContentType();
	         out.print("<br> contentType : " + contentType);
	         
	         if( part.getHeader("Content-Disposition").contains("filename=") ) {
	            out.print("<br> size : "+ part.getSize());
	            String fileName = part.getSubmittedFileName(); // 업로드된 파일 이름
	            out.print("<br> fileName : " + fileName);
	            
	            if (part.getSize() > 0 ) {
	               part.write("C:\\temp" + fileName);
	               part.delete(); // 임시 파일 삭제 -  C:\Tools\apache-tomcat-9.0.88\temp
	            } // if
	            
	         }else {
	            String paramValue= request.getParameter( part.getName() );
	            out.println("<br> paramValue : " + paramValue );
	         }
	         
	         out.print("<hr>");
	         
	      } // foreach
	      
	   }
}
