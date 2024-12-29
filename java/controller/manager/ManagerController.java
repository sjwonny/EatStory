package controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import service.manager.ManagerService;
import vo.goods.GoodsVO;
import vo.goods_detail_img.GoodsDetailImgVO;
import vo.goods_img.GoodsImgVO;
import vo.goods_option.GoodsOptionVO;
import vo.manager.brand.BrandVO;
import vo.manager.manager.ManagerVO;
import vo.qna.QnaVO;

@Controller
public class ManagerController {
	private ManagerService managerService;
	@Autowired
	private ServletContext application;
	
	public ManagerController(ManagerService managerService) {
		this.managerService = managerService;
		System.out.println("managerController");
	}
	
	@RequestMapping("/manager")
	public String main(HttpServletRequest request, HttpSession session) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			Cookie[] cks = request.getCookies();
			
			String email = null;
			Boolean check = false;
			
			if (cks != null) {
				for (Cookie ck : cks) {
					if (ck.getName().equals("ESEmail")) {
						email = ck.getValue();
						check = true;
						break;
					}
				}
			}
			request.setAttribute("check", check);
			request.setAttribute("email", email);
			
			return "/manager/login/login";
		}
		return "/manager/main";
	}
	
	@RequestMapping("/manager/login")
	public String login(HttpServletRequest request, HttpServletResponse response, ManagerVO vo, String emailCheck) {
		ManagerVO login = managerService.checkLogin(vo);
		String msg = null;
		if (login != null) {
			request.getSession().setAttribute("ESmanagerLogin", login);
			
			Cookie ck = null;
			
			Cookie[] cks = request.getCookies();
			
			if (cks != null) {
				for (Cookie c : cks) {
					if (c.getName().equals("ESEmail")) {
						ck = c;
						break;
					}
				}
			}
			if (emailCheck != null) {
				if (ck == null) {
					ck = new Cookie("ESEmail", vo.getEmail());
					ck.setPath("/");
					ck.setMaxAge(60*60*24*7);
					
					response.addCookie(ck);
				} else {
					if (!ck.getValue().equals(vo.getEmail())) {
						ck.setValue(vo.getEmail());
						ck.setPath("/");
						response.addCookie(ck);
					}
				}
			} else {
				if (ck != null) {
					if (ck.getValue().equals(vo.getEmail())) {
						ck.setPath("/");
						ck.setMaxAge(60*60*24*7);
						response.addCookie(ck);
					}
				}
			}
			return "redirect:/manager";
		} else {
			return "redirect:/manager";
		}
	}
	
	@RequestMapping("/manager/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/manager";
	}
	
	@RequestMapping("/manager/qnalist")
	public String qnaList(HttpSession session, Model model) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		List<QnaVO> list = managerService.selectQnaList();
		model.addAttribute("list", list);
		
		return "/manager/qna/qnalist";
	}
	
	@RequestMapping("/manager/userslist")
	public String usersList(HttpSession session) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		return "/manager/users/userslist";
	}
	
	@RequestMapping("/manager/brandlist")
	public String brandList(HttpSession session, Model model) {
		ManagerVO vo = (ManagerVO)session.getAttribute("ESmanagerLogin");
		// vo.getbrand가 0이 아니면 접근 불가 코드 추가 작성 필요
		if (vo == null) {
			return "redirect:/manager";
		} 
		
		List<BrandVO> list = managerService.selectBrandList();
		model.addAttribute("list", list);
		
		return "/manager/brand/list";
	}
	
	@RequestMapping("/manager/brandInsertForm")
	public String brandInsertForm(HttpSession session) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		return "/manager/brand/insert";
	}
	
	@RequestMapping("/manager/brandInsert")
	public String brandInsert(HttpSession session, BrandVO vo) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		int no = managerService.selectBrandNo();
		String savePath = application.getRealPath("/resources/brand");
		
		File saveFile = new File(savePath, String.valueOf(no) + ".jpeg");
		saveFile.mkdirs();
		try {
			vo.getLogo().transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		vo.setNo(no);
		managerService.insertBrand(vo);
		return "redirect:/manager/brandlist";
	}
		
	
	
	
	
	
	@RequestMapping("/manager/qna/detail/{no}")
	public String qnaDetail(HttpSession session, Model model, @PathVariable("no") int no) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		QnaVO vo = managerService.selectQnaDetail(no);
		List<String> iList = managerService.selectQnaImage(no);
		model.addAttribute("iList", iList);
		model.addAttribute("vo", vo);
		
		return "/manager/qna/detail";
	}
	
	@RequestMapping("/manager/qna/answerUpdate/{no}")
	@ResponseBody
	public String qnaAnswerUpdate(HttpSession session, String answer, @PathVariable("no") int no) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		ManagerVO mVo = (ManagerVO) session.getAttribute("ESmanagerLogin");
		int admin_no = mVo.getNo();
		
		QnaVO vo = new QnaVO();
		vo.setAdmin_no(admin_no);
		vo.setAnswer(answer);
		vo.setNo(no);
		
		managerService.updateAnswer(vo);
		
		return null;
	}
	
	@RequestMapping("/manager/qna/answerDelete/{no}")
	@ResponseBody
	public String qnaAnswerDelete(HttpSession session, @PathVariable("no") int no) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		
		managerService.deleteAnswer(no);
		
		return null;
	}
	
	@RequestMapping("/manager/goodslist")
	public String goodsList(HttpSession session, Model model) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		
		List<GoodsVO> goodsList = managerService.selectGoods();
		
		model.addAttribute("goodsList", goodsList);
		
		return "/manager/goods/list";
	}
	
	@RequestMapping("/manager/goodsInsertForm")
	public String goodsInsertForm(HttpSession session, Model model) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		List<BrandVO> brandList = managerService.selectBrandList();
		
		model.addAttribute("brandList", brandList);
		
		return "/manager/goods/insert";
	}
	
	@RequestMapping("/manager/goods/detail/{no}")
	public String goodsDetail(HttpSession session, Model model, @PathVariable("no") int no) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		GoodsVO vo = managerService.selectGoodsVo(no);
		List<GoodsOptionVO> oList = managerService.selectGoodsOptionVo(no);
		List<GoodsImgVO> iList = managerService.selectGoodsImg(no);
		List<GoodsDetailImgVO> dList = managerService.selectGoodsDetailImg(no);
		model.addAttribute("vo", vo);
		model.addAttribute("oList", oList);
		model.addAttribute("iList", iList);
		model.addAttribute("dList", dList);
		
		return "/manager/goods/detail";
	}
	
	@RequestMapping("/manager/goodsUpdate/{no}")
	public String goodsUpdate(HttpSession session, HttpServletRequest request, @PathVariable("no") int no, GoodsVO vo, GoodsOptionVO oVo, GoodsImgVO iVo, MultipartFile[] detailImg) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		
		iVo.getMainImg();
		vo.setNo(no);
		managerService.updateGoods(vo);
		managerService.updateGoodsOptions(no, oVo);
		
		String savePath = application.getRealPath("/resources/goods/" + String.valueOf(no));

		int imgSeq = managerService.selectGoodsImgSeq(no) + 1;
		int detailSeq = managerService.selectGoodsDetailImgSeq(no) + 1;
		
//		이미지 삭제
		String[] deleteImgList = request.getParameterValues("deleteImgList");
		if (deleteImgList != null) {
			managerService.deleteGoodsImg(deleteImgList, no);
			for (String img : deleteImgList) {
				File deleteFile = new File(savePath, img);
				deleteFile.delete();
			}
		}

		
//		대표이미지 저장
		if (iVo.getMainImg() != null) {
			for (int i = 0; i < iVo.getMainImg().length; i++) {
				if (!iVo.getMainImg()[i].getOriginalFilename().equals(" ") && !iVo.getMainImg()[i].getOriginalFilename().equals("")) {
					File file = new File(savePath, "main (" + (i + imgSeq) + ").jpeg");
					try {
						iVo.getMainImg()[i].transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					GoodsImgVO iVo2 = new GoodsImgVO(no, "main (" + (i + imgSeq) + ").jpeg", i + imgSeq); 
					managerService.insertGoodsImg(iVo2);
				}
			}	
		}
		
//		상세 이미지 저장
		if (detailImg != null) {
			for (int i = 0; i < detailImg.length; i++) {
				if (!detailImg[0].getOriginalFilename().equals(" ") && !detailImg[0].getOriginalFilename().equals("")) {
					File file = new File(savePath, "detail (" + (i + detailSeq) + ").jpeg");
					try {
						detailImg[i].transferTo(file);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					GoodsDetailImgVO dVo2 = new GoodsDetailImgVO(no, "detail (" + (i + detailSeq) + ").jpeg", i + detailSeq);
					managerService.insertGoodsDetailImg(dVo2);
				}
			}
		}
		
		return "redirect:/manager/goodslist";
	}
	
	@RequestMapping("/manager/goodsInsert")
	public String goodsInsert(HttpSession session, GoodsVO vo, GoodsOptionVO oVo, GoodsImgVO iVo, MultipartFile[] detailImg) {
		if (session.getAttribute("ESmanagerLogin") == null) {
			return "redirect:/manager";
		}
		
//		goods 정보
		int no = managerService.selectGoodsNo();
		vo.setNo(no);
		managerService.insertGoods(vo);
		
//		대표이미지 저장
		String savePath = application.getRealPath("/resources/goods/" + no);
		for (int i = 0; i < iVo.getMainImg().length; i++) {
			File file = new File(savePath, "main (" + i + ").jpeg");
			file.mkdirs();
			try {
				iVo.getMainImg()[i].transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			GoodsImgVO iVo2 = new GoodsImgVO(no, "main (" + i + ").jpeg", i);
			managerService.insertGoodsImg(iVo2);
		}
		
//		상세 이미지 저장
		for (int i = 0; i < detailImg.length; i++) {
			File saveFile = new File(savePath, "detail (" + i + ").jpeg");
			try {
				detailImg[i].transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			GoodsDetailImgVO dVo2 = new GoodsDetailImgVO(no, "detail (" + i +").jpeg", i);
			managerService.insertGoodsDetailImg(dVo2);
		}
		
		
//		옵션 저장
		if (oVo.getOption_count() != null) {
			for (int i = 0; i < oVo.getOption_count().length; i++) {
				GoodsOptionVO oVo2 = new GoodsOptionVO();
				oVo2.setGoods_no(no);
				oVo2.setDetail(oVo.getOption_detail()[i]);
				oVo2.setCount(oVo.getOption_count()[i]);
				oVo2.setPrice(oVo.getOption_price()[i]);
				managerService.insertGoodsOption(oVo2);
			}
		}
		
		return "redirect:/manager/goodslist";
	}
	
	
	
}
