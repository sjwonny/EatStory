package controller.qna;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import service.qna.QnaService;
import vo.qna.QnaVO;
import vo.qna_image.QnaImageVO;

@Controller
public class QnaController {

	private QnaService qnaService;
	@Autowired
	private ServletContext application;

	public QnaController(QnaService qnaService) {
		this.qnaService = qnaService;
	}

	@RequestMapping("/qna/list")
	public String qnaList(Model model, HttpSession session) {

		Integer userNo = (Integer) session.getAttribute("login"); //로그인 정보를 세션으로 받아와서 userNo에 저장
		if (userNo == null) { //로그인 정보가 없다면 로그인 하고 와라
			return "redirect:/login/loginform";
		}

		List<QnaVO> qnaList = qnaService.selectList(userNo); //로그인한 사람의 qna목록을 qnaList라는 변수에 저장
		int totalCount = qnaService.selectCount(userNo); //로그인한 사람이 올린 qna 글의 개수를 totalCount에 저장

		model.addAttribute("qnaList", qnaList);
		model.addAttribute("totalCount", totalCount);

		return "/qna/list";
	}

	@RequestMapping("/qna/writeform") //list 페이지에서 문의하기 버튼누르면 여기로 이동
	public String writeform(Model model, HttpSession session) {
		Integer userNo = (Integer) session.getAttribute("login");
		if (userNo == null) {
			return "redirect:/";
		}

		return "/qna/write"; //그냥 페이지 이동만 함
	}

	@RequestMapping("/qna/write")
	public String write(HttpSession session, QnaVO qnaVO, QnaImageVO qnaImageVO) {
		
		Integer userNo = (Integer) session.getAttribute("login");
		if (userNo == null) {
			return "/login/loginform";
		}

		int qnaNo = qnaService.selectQnaNo(); //qna 글번호 qnaNo에 저장
		String savePath = application.getRealPath("/resources/qna/" + String.valueOf(qnaNo));

		qnaVO.setNo(qnaNo);
		qnaVO.setUsers_no(userNo); 

		if (qnaService.insertQna(qnaVO) != 0) {

			MultipartFile[] qna_image = qnaImageVO.getImg();

			for (int i = 0; i < qna_image.length; i++) {
				if (!qna_image[i].isEmpty()) {
					File saveQnaFile = new File(savePath, "qna" + (i + 1) + ".jpeg");
					saveQnaFile.mkdirs();
					try {
						qna_image[i].transferTo(saveQnaFile);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					QnaImageVO vo = new QnaImageVO();
					vo.setQna_no(qnaNo);
					vo.setFilename("qna" + (i + 1) + ".jpeg");
					qnaService.insertQnaImage(vo);
				}
			}
		}

		return "redirect:/qna/list";
	}

	@RequestMapping("qna/content/{no}") //list페이지에서 qna 제목 누르면 여기로 보내짐(qna글번호와 함께)
	public String content(Model model, @PathVariable("no") int no, HttpSession session) {
		Integer login = (Integer) session.getAttribute("login");

		if (login == null) {
			return "/login/loginform";
		}

		QnaVO qnvVo = qnaService.selectContent(no);//qna의 모든데이터와 작성자이름 글번호를 매개변수로 가져옴??
		List<QnaImageVO> imgVoList = qnaService.selectImageVoList(no);

		model.addAttribute("login", login); //로그인을 담아서 전달?
		model.addAttribute("vo", qnvVo);
		model.addAttribute("imgList", imgVoList);

		return "/qna/content";
	}

	@RequestMapping("/qna/delete/{no}") //content페이지에서 qna글번호와 함께 여기로 이동
	public String delete(Model model, @PathVariable("no") int no) {

		int su2 = qnaService.deleteQnaImage(no);
		int su1 = qnaService.deleteQna(no);

		model.addAttribute("su2", su2);
		model.addAttribute("su1", su1);
		
		model.addAttribute("status", "delete");
		model.addAttribute("url", "/eatstory/qna/list");

		return "/qna/result";
	}
	/*
	 * @RequestMapping("qna/updateform/{no}") //content페이지에서 글번호와 함께 여기로 이동(수정 버튼
	 * 누를시) public String updateForm(Model model, @PathVariable("no") int no,
	 * HttpSession session, QnaImageVO imgVo) {
	 * 
	 * Integer login = (Integer) session.getAttribute("login");
	 * 
	 * if (login == null) { return "/login/loginform"; }
	 * 
	 * QnaVO vo = qnaService.selectContent(no); List<QnaImageVO> imgVoList =
	 * qnaService.selectImageVoList(no);
	 * 
	 * String content = vo.getContent(); List<String> filenames = new ArrayList<>();
	 * 
	 * for (QnaImageVO imageVO : imgVoList) { filenames.add(imageVO.getFilename());
	 * }
	 * 
	 * vo.setContent(content); imgVo.setFilename(filename[i]);
	 * 
	 * 
	 * 
	 * model.addAttribute("vo", vo); model.addAttribute("imgList", imgVoList);
	 * 
	 * 
	 * return "/qna/update"; }
	 */

	@RequestMapping("qna/update")
	public String update(Model model, QnaVO vo) {
		String content = vo.getContent();

		vo.setContent(content);

		int su = qnaService.updateQna(vo);

		model.addAttribute("su", su);
		model.addAttribute("status", "update");
		model.addAttribute("url", "/eatstory/qna/list");

		return "/qna/result";
	}

}
