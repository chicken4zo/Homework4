package kr.or.bit.service;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.KoreaMemberDao;
import kr.or.bit.dto.KoreaMemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class KoreaMemberDetailService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        System.out.println(request.getParameter("id"));
        try {
            KoreaMemberDao dao = new KoreaMemberDao();
            KoreaMemberDto kdto = dao.detailMember(request.getParameter("id"));
            request.setAttribute("koreaMemberDto", kdto);

            forward = new ActionForward();
            forward.setRedirect(false); //forward
            forward.setPath("/WEB-INF/views/MemberDetail.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;

    }

}
