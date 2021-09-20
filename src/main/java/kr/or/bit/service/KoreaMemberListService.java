package kr.or.bit.service;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.KoreaMemberDao;
import kr.or.bit.dto.KoreaMemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class KoreaMemberListService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        try {
            KoreaMemberDao koreaMemberDao = new KoreaMemberDao();
            List<KoreaMemberDto> memberList = koreaMemberDao.memberList();
            request.setAttribute("memberList", memberList);

            forward = new ActionForward();
            forward.setRedirect(false); //forward
            forward.setPath("/WEB-INF/views/MemberList.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;

    }

}
