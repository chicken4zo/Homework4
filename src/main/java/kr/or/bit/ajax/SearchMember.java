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
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/SearchMember")
public class SearchMember extends HttpServlet {
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mname = request.getParameter("search");
        response.setCharacterEncoding("UTF-8");
        KoreaMemberDao koreaMemberDao = new KoreaMemberDao();
        ArrayList<KoreaMemberDto> searchList = null;
        try {
            searchList = koreaMemberDao.searchList(mname);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        PrintWriter out = response.getWriter();
        for (int i = 0; i < searchList.size(); i++) {
            out.print("<p>" + searchList.get(i).getId() + " | " + searchList.get(i).getName() + " | " + searchList.get(i).getEmail() + "</p><br>");
        }
        out.print(mname);
        out.print("조회결과: " + searchList.size() + "건");

//        request.setAttribute("searchList", searchList);
//        request.setAttribute("mname", mname);
//        request.setAttribute("rowcount", searchList.size());

//        <c:forEach var="search" items="${searchList}">
//									<tr>
//										<td>${search.id}</td>
//										<td>${search.name}</td>
//										<td>${search.email}</td>
//									</tr>
//								</c:forEach>
//								<tr>
//									<td colspan='3'>
//										<b>[${requestScope.mname}] 조회결과 : ${rowcount}건</b>
//									</td>

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
