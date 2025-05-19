package tw.shawn.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tw.shawn.apis.ShawnUtils;

import java.io.IOException;

@WebServlet("/Shawn18")
public class Shawn18 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String x = (String)request.getAttribute("x");
		String y = (String)request.getAttribute("y");
		String result = (String)request.getAttribute("result");
		String view = (String)request.getAttribute("view");
		if (view == null || view.isEmpty()) {
		    view = "default"; // 你可以設定為某個預設的 HTML，如 default.html 或 error.html
		}
		try {
			String webContent = ShawnUtils.loadView(view);
			response.getWriter().print(String.format(webContent, x, y,result));
		}catch(Exception e) {
			System.out.println(e);
		}
	
	
	}

}