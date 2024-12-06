package controller.recipe;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.Paging;
import service.login.LoginService;
import service.recipe.RecipeService;
import vo.end_image.EndImageVO;
import vo.ingre.IngreVO;
import vo.ingredient.IngredientVO;
import vo.method.MethodVO;
import vo.rating.RatingVO;
import vo.recipe.RecipeVO;
import vo.recipe_comment.RecipeCommentVO;
import vo.situation.SituationVO;
import vo.step.StepVO;
import vo.type.TypeVO;

@Controller
public class RecipeController {
	private RecipeService recipeService;

	@Autowired
	private ServletContext application;

	public RecipeController(RecipeService recipeService) {
		this.recipeService = recipeService;
	}

//	@RequestMapping("/recipe/list") //헤더에서 추천,랭킹 누르면 여기로 보내짐
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model) {
		List<RecipeVO> list = recipeService.selectList(); //레시피 리스트 뽑아와서 list변수에 담기,list는 RecipeVO타입
		int count = recipeService.selectCount(); //레시피 테이블의 레코드 수를 count에 담기(레시피 갯수라고 보면 될 듯)

		model.addAttribute("list", list); //레시피 정보 list에 담아 전달
		model.addAttribute("count", count); //레시피 개수 count에 담아 전달

		return "recipe/showlist"; 
	}

	@RequestMapping("/recipe/seperate") //헤더에서 분류 누르면 여기로 보내짐(?type_no=0&situation_no=0&method_no=0&ingre_no=0이렇게 겟방식으로 전달받음)
	public String list(Model model, Integer page, int type_no, int situation_no, int method_no, int ingre_no) {

		if (page == null) {//페이징 처리인가봄
			page = 1;
		}
		

		Map<String, Object> map = new HashMap<String, Object>(); //맵 객체 생성

		map.put("type_no", type_no); //받아온 타입 번호 맵에 저장
		map.put("situation_no", situation_no); //받아온 상황 번호 맵에 저장
		map.put("method_no", method_no); //받아온 방법 번호 맵에 저장
		map.put("ingre_no", ingre_no); //받아온 재료 번호 맵에 저장

		int boardCount = recipeService.getListNum(map); //조건에 맞는 레시피 개수를 구해서 boardCount 라는 변수에 넣음

		Paging paging = new Paging(page, boardCount); 

		map.put("first", paging.getFirst());
		map.put("last", paging.getLast());

		List<RecipeVO> list = recipeService.selectMap(map); //레시피의 모든 정보 조회해서 레시피VO타입의 list에 저장 (어떨 때 map을 넣는거지?)

		List<EndImageVO> eimglist = new ArrayList<EndImageVO>(); // eimglist에 EndImageVO 객체들을 담기, 필요에 따라 eimglist에 EndImageVO 객체를 추가하거나 삭제하여 사용할 수 있음.
		
		
		if (list != null) { //레시피가 있다면
			for (RecipeVO vo : list) { //list길이만큼 반복
				EndImageVO evo = new EndImageVO(); //EndImageVO 객체 생성(evo)
				evo.setRecipe_no(vo.getNo()); //리스트 고유번호를 evo의 레시피 참조키(?)세팅하는데 씀 (궁금한 점 : 여기에 setter써서 하지 않고 sql문에서 recipe_no = #{no} 이런식으로 하면 안되나?)
				eimglist.add(evo); //이미지vo타입의 list에 evo를 넣는다?? 분류페이지 보류 나중에 다시 공부하기!!!!!!!!
			}
		}
		
		

		List<TypeVO> tList = recipeService.selectType();
		List<SituationVO> sList = recipeService.selectSituation();
		List<MethodVO> mList = recipeService.selectMethod();
		List<IngreVO> iList = recipeService.selectIngre();

		model.addAttribute("list", list);
		model.addAttribute("eimglist", eimglist);

		model.addAttribute("tList", tList);
		model.addAttribute("sList", sList);
		model.addAttribute("mList", mList);
		model.addAttribute("iList", iList);

		model.addAttribute("type_no", type_no); //타입
		model.addAttribute("situation_no", situation_no); //상황
		model.addAttribute("method_no", method_no); //방법
		model.addAttribute("ingre_no", ingre_no); //재료

		model.addAttribute("paging", paging); //페이징
		model.addAttribute("boardCount", boardCount);

		model.addAttribute("page_value", "seperate");

		return "recipe/classification";
	}

	@RequestMapping("/recipe/writeform")
	public String writeform(Model model, HttpSession session) {
		Integer no = (Integer) session.getAttribute("login");

		if (no == null) {
			return "redirect:/login/loginform";
		}

		List<TypeVO> typeList = recipeService.selectType();
		List<SituationVO> situationList = recipeService.selectSituation();
		List<MethodVO> methodList = recipeService.selectMethod();
		List<IngreVO> ingreList = recipeService.selectIngre();

		model.addAttribute("typeList", typeList);
		model.addAttribute("situationList", situationList);
		model.addAttribute("methodList", methodList);
		model.addAttribute("ingreList", ingreList);

		return "recipe/writeForm";
	}

	@RequestMapping("/recipe/write") //update페이지에서 여기로 이동
	public String write(HttpSession session, RecipeVO recipeVo, IngredientVO ingredientVo, StepVO stepVo,
			MultipartFile[] step_photo, EndImageVO endImageVo) {
		Integer userNo = (Integer) session.getAttribute("login");

		if (userNo == null) {
			return "/login/login";
		}

		int recipeNo = recipeService.selectRecipeNo();
		String savePath = application.getRealPath("/resources/recipe/" + String.valueOf(recipeNo));

		MultipartFile photo = recipeVo.getMain_photo();
		File saveFile = new File(savePath, "main.jpeg");
		saveFile.mkdirs();
		try {
			photo.transferTo(saveFile);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		recipeVo.setNo(recipeNo);
		recipeVo.setUser_no(userNo);

		if (recipeVo.getVideo() != null) {
			String saveVideo = recipeVo.getVideo().substring(recipeVo.getVideo().lastIndexOf("=") + 1);
			recipeVo.setVideo(saveVideo);
		}

		if (recipeService.insertRecipe(recipeVo) != 0) {
			recipeService.insertIngredient(ingredientVo, recipeNo);

			int n = 0;
			for (StepVO vo : stepVo.getStepVoList()) {
				if (vo.getDetail() != null) {
					vo.setRecipe_no(recipeNo);
					MultipartFile stepPhoto = step_photo[n];
					File saveStepPhoto = new File(savePath, "step (" + (n) + ").jepg");
					saveFile.mkdirs();
					try {
						stepPhoto.transferTo(saveStepPhoto);
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					vo.setImg("step (" + (n) + ").jepg");
					n++;
					recipeService.insertStep(vo);
				}
			}

			MultipartFile[] end_image = endImageVo.getEnd_image();

			for (int i = 0; i < end_image.length; i++) {
				File saveEndFile = new File(savePath, "end (" + (i) + ").jpeg");
				saveEndFile.mkdirs();
				try {
					end_image[i].transferTo(saveEndFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				EndImageVO vo = new EndImageVO();
				vo.setRecipe_no(recipeNo);
				vo.setImg("end (" + (i) + ").jpeg");

				recipeService.insertEndImage(vo);
			}
		}
		return "redirect:/recipe/list";
	}

	@RequestMapping("/recipe/{no}")
	public String detail(Model model, @PathVariable("no") int no, HttpSession session) {
//		새로고침 시 조회수 증가 막는 코드 작성 필요
		Integer login = (Integer) session.getAttribute("login");
		recipeService.updateHit(no);

		RecipeVO recipeVo = recipeService.selectContent(no);
		List<StepVO> stepVoList = recipeService.selectStepVoList(no);
		List<IngredientVO> IngredientVoList = recipeService.selectIngredientVoList(no);

//		List<List<String>> iList = new ArrayList<List<String>>();
//		
//		for (IngredientVO vo : IngredientVoList) {
//			List<String> list = new ArrayList<String>();
//			list.add(vo.getCategory());
//			list.addAll(Arrays.asList(vo.getContent().split(",")));
//			list.addAll(Arrays.asList(vo.getAmount().split(",")));
//			iList.add(list);
//		}
		List<EndImageVO> imgVoList = recipeService.selectEndImageVO(no);
//		List<RecipeCommentVO> comVoList = recipeService.selectRecipeCommentVoList(no);
		List<Map<String,Object>> comVoList = recipeService.selectRecipeCommentVoList(no);

		model.addAttribute("login", login);
		model.addAttribute("vo", recipeVo);
		model.addAttribute("sList", stepVoList);
		model.addAttribute("iList", IngredientVoList);
		model.addAttribute("imgList", imgVoList);
		model.addAttribute("comList", comVoList);

		return "/recipe/detail";
	}

	@RequestMapping("/recipe/delete/{no}")
	public String delete(Model model, @PathVariable("no") int no) {

		recipeService.deleteRecipe(no);

		return "redirect:/recipe/list";
	}

	@RequestMapping("/recipe/updateform/{no}")
	public String update(Model model, @PathVariable("no") int no) {
		RecipeVO recipeVo = recipeService.selectContent(no);
		List<StepVO> stepVoList = recipeService.selectStepVoList(no);
		List<IngredientVO> IngredientVoList = recipeService.selectIngredientVoList(no);

		List<List<String>> iList = new ArrayList<List<String>>();
		
		for (IngredientVO vo : IngredientVoList) {
			List<String> list = new ArrayList<String>();
			list.add(vo.getCategory());
			list.addAll(Arrays.asList(vo.getContent().split(",")));
			list.addAll(Arrays.asList(vo.getAmount().split(",")));
			iList.add(list);
		}
		
		List<TypeVO> typeList = recipeService.selectType();
		List<SituationVO> situationList = recipeService.selectSituation();
		List<MethodVO> methodList = recipeService.selectMethod();
		List<IngreVO> ingreList = recipeService.selectIngre();
		List<EndImageVO> imgVoList = recipeService.selectEndImageVO(no);

		model.addAttribute("typeList", typeList);
		model.addAttribute("situationList", situationList);
		model.addAttribute("methodList", methodList);
		model.addAttribute("ingreList", ingreList);
		
		

		model.addAttribute("vo", recipeVo);
		model.addAttribute("sList", stepVoList);
		model.addAttribute("iList", IngredientVoList);
		model.addAttribute("imgList", imgVoList);
		return "/recipe/update";
	}

	@RequestMapping(value = "/recipe/rating/{no}", produces = "application/text;charset=utf8")
	@ResponseBody
	public String rating(@PathVariable("no") int no, int score, HttpSession session) {
		Integer login = (Integer) session.getAttribute("login");

		RatingVO vo = new RatingVO();
		vo.setRecipe_no(no);
		vo.setUsers_no(login);
		vo.setScore(score);

		return Double.toString(recipeService.insertRating(vo));
	}

	@RequestMapping("/recipe/comment/{no}")
	public String comment(@PathVariable("no") int no, RecipeCommentVO vo, HttpSession session) {
		Integer login = (Integer) session.getAttribute("login");
		vo.setRecipe_no(no);
		vo.setUsers_no(login);
		vo.setComment_no(recipeService.selectCommentNo());

		recipeService.insertComment(vo);

		String url = "redirect:/recipe/" + no;
		return url;
	}
	
	
	
	

	
	
	
	
	
	
	
	
	
	

}
