package kr.or.bit.ajax;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/LoginLogout")
public class LoginLogout extends HttpServlet {
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setCharacterEncoding("UTF-8");
        String id = (String) session.getAttribute("userid");
        PrintWriter out = response.getWriter();
        System.out.println("loginlogout!!");

        if (id != null) {
            out.print("<b>" + id + "</b> 님 환영합니다   ");
            out.print("<a href='common/logout.jsp' id='loginlogout' class=" + id + ">Log out</a>");
        } else {
            out.print("<a href='KoreaMemberLoginForm.do' id='loginlogout'>Log in</a>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);

    }
}
