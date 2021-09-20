package kr.or.bit.service;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.KoreaMemberDao;
import kr.or.bit.dto.KoreaMemberDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		KoreaMemberDto dto = null;
		ActionForward forward = new ActionForward();

		try {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			System.out.println(id);
			System.out.println(pwd);

			KoreaMemberDao dao = new KoreaMemberDao();
			dto = dao.loginId(id);
			System.out.println(dto);

			if (dto != null) {
				if (pwd.equals(dto.getPwd())) { // ID 존재 , PWD(0)
					// 정상회원
					// Top.jsp 정보 로그인 상태 ...
					session.setAttribute("userid", id);
					// 이동처리
					forward.setPath("Main.do");
				} else {
					// ID 존재 , PWD(x)
					forward.setPath("Main.do");
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		forward.setRedirect(false);
		return forward;
	}
}
