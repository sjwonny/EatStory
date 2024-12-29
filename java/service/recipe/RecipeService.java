package service.recipe;

import java.util.List;
import java.util.Map;

import dao.ingre.IngreDAO;
import dao.method.MethodDAO;
import dao.recipe.RecipeDAO;
import dao.situation.SituationDAO;
import dao.type.TypeDAO;
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

public class RecipeService {
	private RecipeDAO recipeDao;
	private TypeDAO typeDao;
	private SituationDAO situationDao;
	private MethodDAO methodDao;
	private IngreDAO ingreDao;

	public RecipeService(RecipeDAO recipeDao, TypeDAO typeDao, SituationDAO situationDao, MethodDAO methodDao,
			IngreDAO ingreDao) {
		this.recipeDao = recipeDao;
		this.typeDao = typeDao;
		this.situationDao = situationDao;
		this.methodDao = methodDao;
		this.ingreDao = ingreDao;
	}

	public List<RecipeVO> selectList() {
		List<RecipeVO> list = recipeDao.selectList();

		if (list.isEmpty()) {
			list = null;
		}

		return list;
	}

	public int selectCount() {
		int no = recipeDao.selectCount();

		return no;
	}

	public List<TypeVO> selectType() {
		List<TypeVO> list = typeDao.selectList();
		return list;
	}

	public List<SituationVO> selectSituation() {
		List<SituationVO> list = situationDao.selectList();
		return list;
	}

	public List<MethodVO> selectMethod() {
		List<MethodVO> list = methodDao.selectList();
		return list;
	}

	public List<IngreVO> selectIngre() {
		List<IngreVO> list = ingreDao.selectList();
		return list;
	}

	public int selectRecipeNo() {
		return recipeDao.selectRecipeNo();
	}

	public int insertRecipe(RecipeVO vo) {
		return recipeDao.insertRecipe(vo);
	}

	public int insertStep(StepVO vo) {
		return recipeDao.insertStep(vo);
	}

//	public int insertIngredient(IngredientVO vo) {
//		return recipeDao.insertIngredient(vo);
//	}

	public void insertIngredient(IngredientVO list, int no) {
		for (IngredientVO vo : list.getIngredientVoList()) {
			if (vo.getAmountArr() != null) {
				for (int i = 0; i < vo.getAmountArr().length; i++) {
					if (vo.getAmountArr()[i] != null) {
						IngredientVO insertVo = new IngredientVO();
						insertVo.setRecipe_no(no);
						insertVo.setAmount(vo.getAmountArr()[i]);
						insertVo.setCategory(vo.getCategoryArr()[0]);
						insertVo.setContent(vo.getContentArr()[i]);
						recipeDao.insertIngredient(insertVo);
					}
				}
			}
		}
	}

	public int insertEndImage(EndImageVO vo) {
		return recipeDao.insertEndImage(vo);
	}

	public RecipeVO selectContent(int no) {
		return recipeDao.selectContent(no);
	}

	public List<StepVO> selectStepVoList(int no) {
		return recipeDao.selectStepVoList(no);
	}

	public List<IngredientVO> selectIngredientVoList(int no) {
		return recipeDao.selectIngredientVoList(no);
	}

	public List<EndImageVO> selectEndImageVO(int no) {
		return recipeDao.selectEndImageVoList(no);
	}

	
	  public List<Map<String,Object>> selectRecipeCommentVoList(int no) { return
	  recipeDao.selectRecipeCommentVoList(no); }
	 

	
//	  public List<RecipeCommentVO> selectRecipeCommentVoList(int no) { return
//	  recipeDao.selectRecipeCommentVoList(no); }

	public int updateHit(int no) {
		return recipeDao.updateHit(no);
	}

//	레시피 삭제
	public void deleteRecipe(int no) {
		recipeDao.deleteStep(no);
		recipeDao.deleteEndImage(no);
		recipeDao.deleteIngredient(no);
		recipeDao.deleteRecipe(no);
	}

//	별점
	public double insertRating(RatingVO vo) {
		recipeDao.insertRating(vo);
		recipeDao.updateScore(vo.getRecipe_no());
		return recipeDao.selectScore(vo.getRecipe_no());
	}

//	댓글 작성
	public int selectCommentNo() {
		return recipeDao.selectCommentNo();
	}

	public void insertComment(RecipeCommentVO vo) {
		recipeDao.insertComment(vo);
	}

// 리스트 분류	
	public List<RecipeVO> selectMap(Map<String, Object> map) {

		List<RecipeVO> list = recipeDao.selectMap(map);

		if (list.isEmpty()) {
			list = null;
		}

		return list;
	}

// 페이징 레시피 갯수 세기
	public int getListNum(Map<String, Object> map) {
		return recipeDao.getListNum(map);
	}

}
