package kr.or.bit.controller;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "*.do")
public class KoreaMemberController extends HttpServlet {
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String url_Command = requestURI.substring(contextPath.length());

        ActionForward forward = null;
        Action action = null;

        if (url_Command.equals("/KoreaMemberJoin.do")) {
            action = new KoreaMemberJoinService();
            forward = action.execute(request, response);
            System.out.println("KoreaMemberJoin Start");
        } else if (url_Command.equals("/KoreaMemberDelete.do")) {
//UI+로직
            action = new KoreaMemberDeleteService();
            forward = action.execute(request, response);
            System.out.println("MemoDeleteService 실행");

        } else if (url_Command.equals("/KoreaMemberDetail.do")) { //상세보기
            //UI+로직
            action = new KoreaMemberDetailService();
            forward = action.execute(request, response);
            System.out.println("MemberDetailService 실행");

        } else if (url_Command.equals("/KoreaMemberEdit.do")) {
            action = new EditMemberService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/KoreaMemberList.do")) { //목록보기
            action = new KoreaMemberListService();
            forward = action.execute(request, response);
            System.out.println("MemberListService 실행");

        } else if (url_Command.equals("/KoreaMemberSearch.do")) { //검색하기
            action = new KoreaMemberSearchService();
            forward = action.execute(request, response);
            System.out.println("MemberSearchService 실행");
        } else if (url_Command.equals("/KoreaMemberLogin.do")) {
            action = new MemberLoginService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/Main.do")) {
            action = new MainService();
            forward = action.execute(request, response);
        } else if (url_Command.equals("/KoreaMemberJoinForm.do")) {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/JoinForm.jsp");
        } else if (url_Command.equals("/KoreaMemberLoginForm.do")) {
            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/Login.jsp");
        }

        if (forward != null) {
            if (forward.isRedirect()) { //true 페이지를 재요청
                response.sendRedirect(forward.getPath());
            } else { // false
                //1.UI + 로직이 다 있는 경우
                //2.UI만 있는 경우
                System.out.println("forward: " + forward.getPath());
                RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
                dis.forward(request, response);
            }
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
