package controller.users;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.users.UsersService;
import vo.users.UsersVO;

@Controller
public class UsersController {
	@Autowired // 추가
	private UsersService usersService;

	public UsersController(UsersService usersService) {
		this.usersService = usersService;
	}

	@RequestMapping("/users/joinform")
	public String joinForm() {
		return "/users/joinForm";
	}

	// 회원가입
	@RequestMapping("/users/join")
	public String join(Model model, UsersVO vo) {
		System.out.println(vo);

		// 이메일 중복 검사
		boolean emailDuplicate = usersService.checkEmail(vo.getEmail());
		if (emailDuplicate) {
			String msg = "이미 사용 중인 이메일입니다.";
			String url = "/eatstory/users/joinform";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "/users/result";
		}

		// 전화번호 중복 검사
		boolean phoneDuplicate = usersService.checkPhone(vo.getPhone());
		if (phoneDuplicate) {
			String msg = "이미 사용 중인 전화번호입니다.";
			String url = "/eatstory/users/joinform";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "/users/result";
		}

		// 이메일 형식 검증을 위한 정규식 패턴
		String emailPattern = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}";

		// 이메일 형식이 맞지 않을 경우 회원가입 실패 처리
		if (!vo.getEmail().matches(emailPattern)) {
			String msg = "이메일 형식이 올바르지 않습니다.";
			String url = "/eatstory/users/joinform";
			model.addAttribute("url", url);
			model.addAttribute("msg", msg);
			return "/users/result";
		}

		// 나머지 로직 실행
		if (vo.getImg() == null) {
			vo.setImg(" "); // 나중에 기본프사 경로 TODO :
		}

		int su = usersService.insert(vo);

		String url;
		String msg;

		if (su != 0) {
			msg = "회원가입 성공! 로그인 페이지로 이동합니다.";
			url = "/eatstory/login/loginform?id=" + vo.getId();
		} else {
			msg = "회원가입 실패! 이전 페이지로 이동합니다.";
			url = "history.back()";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "/users/result";
	}

	// 회원정보
	@RequestMapping("/users/mypage")
	public String myPage(Model model, HttpSession session) {
		Integer no = (Integer) session.getAttribute("login");

		if (no == null) {
			return "redirect:/login/loginform";
		}

		UsersVO vo = usersService.selectOne(no);

		model.addAttribute("vo", vo);

		return "/users/myPage";
	}

	// 회원정보 수정
	@RequestMapping("/users/updateform")
	public String updateForm(Model model, HttpSession session) {

		Integer no = (Integer) session.getAttribute("login");

		if (no == null) {
			return "redirect:/login/loginform";
		}

		UsersVO vo = usersService.selectOne(no);

		model.addAttribute("vo", vo);

		return "/users/updateForm";
	}

	@RequestMapping("/users/deleteform")
	public String updateForm() {

		return "/users/deleteForm";
	}

	// 회원정보 수정
	@RequestMapping("/users/update")
	public String update(Model model, HttpSession session, UsersVO vo) {

		Integer no = (Integer) session.getAttribute("login");

		if (no == null) {
			return "redirect:/login/loginform";
		}

		vo.setNo(no);

		String pw = vo.getPw();
		// 비밀번호 유효성 체크
		boolean isValidPassword = validatePassword(pw);

		if (!isValidPassword) {
			model.addAttribute("msg", "비밀번호가 유효하지 않습니다.(영문,숫자,특수문자 조합하여 8~16자)");
			model.addAttribute("url", "/eatstory/users/updateform");
			return "/users/result";
		}

		String name = vo.getName();
		// 이름 유효성 체크
		boolean isValidName = validateName(name);

		if (!isValidName) {
			model.addAttribute("msg", "이름은 한글만 입력 가능합니다.");
			model.addAttribute("url", "/eatstory/users/updateform");
			return "/users/result";
		}

		// 이메일 중복 검사
		if (!vo.getEmail().equals(usersService.getEmailById(vo.getNo()))) { // 입력된 이메일이 자신의 이메일이 아닌 경우에만 중복 검사 수행
			boolean emailDuplicate = usersService.checkEmail(vo.getEmail());
			if (emailDuplicate) {
				String msg = "이미 사용 중인 이메일입니다.";
				String url = "/eatstory/users/updateform";
				model.addAttribute("url", url);
				model.addAttribute("msg", msg);
				return "/users/result";
			}
		}

		int su = usersService.update(vo);

		String msg = null;
		String url = null;

		if (su != 0) {
			msg = "수정완료!!MyPage로...";
			url = "/eatstory/users/mypage";
		} else {
			msg = "수정실패!!이전페이지로...";
			url = "/eatstory/users/updateform";
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "/users/result";
	}

	// 비밀번호 재설정 페이지로 이동
	@GetMapping("/users/resetpwform")
	public String resetPasswordForm(@RequestParam String id, Model model) {
		model.addAttribute("id", id);
		return "/users/resetpw";
	}

	//
	// 비밀번호 재설정 처리
	@RequestMapping("/users/resetpw")
	public String updatePw(@RequestParam String id, @RequestParam String pw, Model model) {
		// 기존 아이디 검증
		String idError = validateUserId(id); // 아이디 유효성 검증 메소드 호출

		if (idError == null) {
			// 아이디가 유효하지 않은 경우 처리 로직
			model.addAttribute("idError", idError);
			return "/users/resetpw";
		}

		// 비밀번호 재설정 로직 실행
		int result = usersService.updatePw(id, pw);
		boolean success = result > 0;

		String msg;
		String url;

		if (success) {
			// 비밀번호 재설정 성공
			msg = "비밀번호 재설정 성공! 로그인 페이지로 이동합니다.";
			url = "/eatstory/login/loginform";
		} else {
			// 비밀번호 재설정 실패
			msg = "비밀번호 재설정 실패! 이전 페이지로 이동합니다.";
			url = "/eatstory/users/resetpwform?id=" + id;
		}

		model.addAttribute("url", url);
		model.addAttribute("msg", msg);

		return "/users/pwresult";

	}

	// 아이디 검사
	private String validateUserId(String id) {
		String idPattern = "^(?=.*[a-zA-Z])(?=.*\\\\d)[a-zA-Z\\\\d]{6,16}$";
		if (!id.matches(idPattern)) {
			return "아이디가 유효하지 않습니다.(영문,숫자 조합하여 6~16자)";
		}
		return null; // 유효성 검사 통과
	}

	// 비밀번호 유효성 체크 메서드
	private boolean isValidPassword(String pw) {
		// 비밀번호 유효성 조건 확인
		String passwordPattern = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		return pw.matches(passwordPattern);
	}

	// 비밀번호 유효성 체크 메소드
	private boolean validatePassword(String pw) {
		// 비밀번호 유효성 조건 확인
		String passwordPattern = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,16}$";
		return pw.matches(passwordPattern);
	}

	// 이름 유효성 체크 메소드
	private boolean validateName(String name) {
		// 이름 유효성 조건 확인
		String namePattern = "^[가-힣]+$";
		return name.matches(namePattern);
	}

	// 회원탈퇴
	@RequestMapping("/users/delete")
	public String delete(HttpServletRequest request, HttpServletResponse response, String pw) {

		Integer no = (Integer) request.getSession().getAttribute("login");

		if (no == null) {
			return "redirect:/login/loginform";
		}

		UsersVO vo = usersService.selectOne(no);

		String msg = null;
		String url = null;

		if (!vo.getPw().equals(pw)) {
			msg = "비밀번호가 틀렸습니다. 이전페이지로...";
			url = "/eatstory/users/deleteform";
		} else {
			int su = usersService.delete(no);

			if (su != 0) {
				msg = "회원탈퇴가 정상적으로 되었습니다.";
				url = "/eatstory/";

				Cookie[] cks = request.getCookies();

				if (cks != null) {
					for (Cookie ck : cks) {
						if (ck.getName().equals("ckid")) {
							if (ck.getValue().equals(vo.getId())) {
								ck.setMaxAge(0);
								ck.setPath("/");
								response.addCookie(ck);
								break;
							}
						}
					}
				}

				request.getSession().invalidate();

			} else {
				msg = "탈퇴 실패! 이전페이지로...";
				url = "/eatstory/users/deleteform";
			}
		}

		request.setAttribute("url", url);
		request.setAttribute("msg", msg);

		return "/users/result";
	}

	// 아이디 중복검사
	@RequestMapping(value = "/users/checkId", produces = "application/text;charset=utf8")
	@ResponseBody
	public String checkId(String id) {

		if (usersService.checkId(id)) {
			return "이미 사용중인 ID입니다.";
		} else {
			return "사용 가능한 ID입니다";
		}
	}

}
