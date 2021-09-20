package kr.or.bit.service;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.KoreaMemberDao;
import kr.or.bit.dto.KoreaMemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class KoreaMemberSearchService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        ActionForward forward = null;
        try {
            String mname = request.getParameter("search");
            KoreaMemberDao koreaMemberDao = new KoreaMemberDao();
            System.out.println(mname);
            ArrayList<KoreaMemberDto> searchList = koreaMemberDao.searchList(mname);
            System.out.println(searchList.size());
            request.setAttribute("searchList", searchList);
            request.setAttribute("mname", mname);
            request.setAttribute("rowcount", searchList.size());

            forward = new ActionForward();
            forward.setRedirect(false); //forward
            forward.setPath("/WEB-INF/views/MemberList.jsp");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return forward;

    }

}
