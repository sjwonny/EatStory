package controller.login;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.login.LoginService;
import vo.users.UsersVO;

@Controller
public class LoginController {

	private LoginService loginService;

	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}

	@RequestMapping("/login/loginform")
	public String LoginForm(HttpServletRequest request, String id) {

		boolean check = false;

		if (id == null) {
			Cookie[] cks = request.getCookies();

			if (cks != null) {
				for (Cookie ck : cks) {
					if (ck.getName().equals("ckid")) {
						id = ck.getValue();
						check = true;
						break;
					}
				}
			}
		}

		request.setAttribute("id", id);
		request.setAttribute("check", check);

		return "login/login";
	}

	//

	@RequestMapping("/login/check")
	public String checkLogin(HttpServletRequest request, HttpServletResponse response, UsersVO vo) {

		int no = loginService.checkLogin(vo);

		String msg = null;
		String url = null;
		boolean check = false;

		if (no != 0) {
			// msg = vo.getId() + "님이 로그인하셨습니다.";
			msg = "로그인 성공!";
			url = "/eatstory/";
			check = true;

			request.getSession().setAttribute("login", no);

			// 아이디 기억하기 체크 유무
			String ckid = request.getParameter("ckid");

			Cookie ck = null;

			// 쿠키파일 읽어 오기...
			Cookie[] cks = request.getCookies();

			// 기존 쿠키파일 검색
			if (cks != null) {
				for (Cookie c : cks) {
					if (c.getName().equals("ckid")) {
						ck = c;
						break;
					}
				}
			}

			if (ckid != null) { // 체크 되어 있을때
				if (ck == null) { // 쿠키파일 없을때
					ck = new Cookie("ckid", vo.getId());

					// root로 경로 설정
					ck.setPath("/");

					// 유효시간 설정
					ck.setMaxAge(60 * 60 * 24);

					// 클라이언트에게 쿠키파일 생성
					response.addCookie(ck);
				} else { // 있을때
					if (!ck.getValue().equals(vo.getId())) {
						ck.setValue(vo.getId());
						ck.setPath("/");
						response.addCookie(ck);
					}
				}
			} else { // 체크 안되어 있을때
				if (ck != null) {
					if (ck.getValue().equals(vo.getId())) {
						ck.setPath("/");
						ck.setMaxAge(0);
						response.addCookie(ck);
					}
				}
			}

		} else {
			msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
			url = "/eatstory/login/loginform";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		request.setAttribute("check", check);

//		return "/result";
		return "/login/result";

	}

	// 아이디 찾기 버튼
	@RequestMapping("/login/findidform")
	public String findidForm() {
		return "/login/findid";
	}

	// 비밀번호 찾기 버튼
	@RequestMapping("/login/findpwform")
	public String findpwForm() {
		return "/login/findpw";
	}

	// 아이디 조회
	@RequestMapping("/login/findid")
	public String findId(Model model, UsersVO vo) {

		String find = null;

		if (vo.getId() == null) {
			find = loginService.findId(vo);
		}

		boolean check = false;
		String idResult = null;

		if (find != null) {
			check = true;
			String re = "";
			for (int i = 0; i < find.length(); i++) {
				if (i % 2 == 0) {
					re += find.charAt(i);
				} else {
					re += "*";
				}
			}

			idResult = re;
		}

		model.addAttribute("idResult", idResult); // idResult 변수 추가
		model.addAttribute("check", check);

		return "/login/findidresult";
	}

	// 비밀번호 조회
	@RequestMapping("/login/findpw")
	public String findPw(Model model, UsersVO vo) {
		String find = loginService.findPw(vo);

		boolean check = false; // 일치하는 계정이 있는지 여부를 판단하기 위한 변수

		if (find != null) {
			check = true; // 일치하는 계정이 있다면 check를 true로 설정
			String re = "";
			for (int i = 0; i < find.length(); i++) {
				if (i % 2 == 0) {
					re += find.charAt(i);
				} else {
					re += "*";
				}
			}
			model.addAttribute("pw", re);
			model.addAttribute("idResult", true); // 일치하는 계정이 있는 경우에 "idResult" 속성을 추가하여 템플릿에서 사용할 수 있도록 함
		}

		model.addAttribute("check", check);
		model.addAttribute("noResult", true); // 일치하는 계정이 없는 경우에 "noResult" 속성을 추가하여 템플릿에서 사용할 수 있도록 함
		return "login/findpwresult";
	}

	// 로그아웃
	@RequestMapping("/login/logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "/login/logout";
	}

}
