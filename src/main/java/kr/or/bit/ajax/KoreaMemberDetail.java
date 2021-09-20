package kr.or.bit.ajax;

import kr.or.bit.dao.KoreaMemberDao;
import kr.or.bit.dto.KoreaMemberDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "KoreaMemberDetail", value = "/KoreaMemberDetail")
public class KoreaMemberDetail extends HttpServlet {
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        KoreaMemberDao dao = new KoreaMemberDao();
        response.setCharacterEncoding("UTF-8");
        System.out.println(request.getParameter("id"));
        KoreaMemberDto kdto = dao.detailMember(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        out.print("ID " + kdto.getId() + "<br>");
        out.print("Password " + kdto.getPwd() + "<br>");
        out.print("이름 " + kdto.getName() + "<br>");
        out.print("나이 " + kdto.getAge() + "<br>");
        out.print("성별 " + kdto.getGender() + "<br>");
        out.print("이메일 " + kdto.getEmail() + "<br>");
        out.print("<a href=\"KoreaMemberList.do\">목록가기</a>");

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
