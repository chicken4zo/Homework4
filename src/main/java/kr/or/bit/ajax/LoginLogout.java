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
//        System.out.println("loginlogout!!");

        if (id != null) {
            out.print("<li class=\"nav-item\">");
            out.print("<span class=\"no-icon welcome\" id=" + id + ">");
            out.print("<b>" + id + "</b> 님 환영합니다   ");
            out.print("<a href='common/logout.jsp'>Log out</a>");
            out.print("</span></a></li>");
        } else {
            out.print("<li class=\"nav-item\" id=\"register\">");
            out.print("<a class=\"nav-link\" href=\"KoreaMemberJoinForm.do\">");
            out.print("<span class=\"no-icon\">Register</span>");
            out.print("</a></li>");
            out.print("<li class=\"nav-item\">");
            out.print("<a class=\"nav-link\" href=\"KoreaMemberLoginForm.do\">");
            out.print("<span class=\"no-icon\">Log in</span");
            out.print("</span></a></li>");
        }
    }

//    <li class="nav-item" id="register">
//            <a class="nav-link" href="KoreaMemberJoinForm.do">
//                <span class="no-icon">Register</span>
//            </a>
//        </li>
//        <li class="nav-item">
//            <a class="nav-link" href="#">
//                <span class="no-icon" id="loginlogout"></span>
//            </a>
//        </li>

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);

    }
}
