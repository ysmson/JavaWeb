package tw.shawn.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/Shawn05")
public class Shawn05 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String xStr = request.getParameter("x");
        String yStr = request.getParameter("y");
        int x = 0;
        int y = 0;
        boolean hasError = false;
        String errorMessage = "";

        if (xStr == null || xStr.isEmpty() || yStr == null || yStr.isEmpty()) {
            hasError = true;
            errorMessage = "必須提供 'x' 和 'y' 參數。";
        } else {
            try {
                x = Integer.parseInt(xStr);
                y = Integer.parseInt(yStr);
            } catch (NumberFormatException e) {
                hasError = true;
                errorMessage = "提供的 'x' 或 'y' 參數不是有效的數字。";
            }
        }

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"zh-TW\">");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>計算結果</title>");
        out.println("</head>");
        out.println("<body>");

        if (hasError) {
            out.println("<h1>錯誤</h1>");
            out.println("<p>" + errorMessage + "</p>");
        } else {
            int result = x + y;
            out.printf("<h1>%s + %s = %d</h1>", xStr, yStr, result);
        }

        out.println("</body>");
        out.println("</html>");

        response.flushBuffer();
    }
}