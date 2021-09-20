package kr.or.bit.service;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.KoreaMemberDao;
import kr.or.bit.dto.KoreaMemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditMemberService implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");

        ActionForward forward = null;

        if (name == null) {
            KoreaMemberDao dao = new KoreaMemberDao();
            KoreaMemberDto kdto = dao.detailMember(id);

            request.setAttribute("detailmember", kdto);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/MemberEdit.jsp");
        } else {
            KoreaMemberDto kdto = new KoreaMemberDto();
            int age = Integer.parseInt(request.getParameter("age"));
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            kdto.setName(name);
            kdto.setAge(age);
            kdto.setEmail(email);
            kdto.setGender(gender);
            kdto.setId(id);

            KoreaMemberDao dao = new KoreaMemberDao();
            int result = dao.editMember(kdto);

            String msg = "";
            String url = "";

            if (result > 0) {
                msg = "수정성공";
                url = "KoreaMemberList.do";
            } else {
                msg = "수정실패";
                url = "KoreaMemberList.do";
            }

            request.setAttribute("board_msg", msg);
            request.setAttribute("board_url", url);

            forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/WEB-INF/views/redirect.jsp");

        }
        return forward;
    }
}
