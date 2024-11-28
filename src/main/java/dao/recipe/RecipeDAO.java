package dao.recipe;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.end_image.EndImageVO;
import vo.ingredient.IngredientVO;
import vo.rating.RatingVO;
import vo.recipe.RecipeVO;
import vo.recipe_comment.RecipeCommentVO;
import vo.step.StepVO;

public class RecipeDAO {
	private SqlSession sqlSession;

	public RecipeDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<RecipeVO> selectList() {
		return sqlSession.selectList("recipe.selectList");
	}

	public int selectCount() {
		return sqlSession.selectOne("recipe.selectCount");
	}

	public int selectRecipeNo() {
		return sqlSession.selectOne("recipe.selectRecipeNo");
	}

	public int insertRecipe(RecipeVO vo) {
		return sqlSession.insert("recipe.insertRecipe", vo);
	}

	public int insertStep(StepVO vo) {
		return sqlSession.insert("recipe.insertStep", vo);
	}

	public int insertIngredient(IngredientVO vo) {
		return sqlSession.insert("recipe.insertIngredient", vo);
	}

	public int insertEndImage(EndImageVO vo) {
		return sqlSession.insert("recipe.insertEndImage", vo);
	}

	public RecipeVO selectContent(int no) {
		return sqlSession.selectOne("recipe.selectContent", no);
	}

	public List<StepVO> selectStepVoList(int no) {
		return sqlSession.selectList("recipe.selectStepVoList", no);
	}

	public List<IngredientVO> selectIngredientVoList(int no) {
		return sqlSession.selectList("recipe.selectIngredientVoList", no);
	}

	public List<EndImageVO> selectEndImageVoList(int no) {
		return sqlSession.selectList("recipe.selectEndImageVoList", no);
	}

	public int updateHit(int no) {
		return sqlSession.update("recipe.updateHit", no);
	}

//	레시피 삭제
	public int deleteStep(int no) {
		return sqlSession.delete("recipe.deleteStep", no);
	}

	public int deleteEndImage(int no) {
		return sqlSession.delete("recipe.deleteEndImage", no);
	}

	public int deleteIngredient(int no) {
		return sqlSession.delete("recipe.deleteIngredient", no);
	}

	public int deleteRecipe(int no) {
		return sqlSession.delete("recipe.deleteRecipe", no);
	}

//	별점
	public int insertRating(RatingVO vo) {
		return sqlSession.insert("recipe.insertRating", vo);
	}

	public int updateScore(int no) {
		return sqlSession.insert("recipe.updateScore", no);
	}

	public double selectScore(int no) {
		return sqlSession.selectOne("recipe.selectScore", no);
	}

//	댓글
	public int selectCommentNo() {
		return sqlSession.selectOne("recipe.selectCommentNo");
	}

	public void insertComment(RecipeCommentVO vo) {
		sqlSession.insert("recipe.insertComment", vo);
	}

	
//	 public List<RecipeCommentVO> selectRecipeCommentVoList(int no) { return
//	 sqlSession.selectList("recipe.selectComment", no); }
	 
	public List<Map<String,Object>> selectRecipeCommentVoList(int no) { 
		return sqlSession.selectList("recipe.selectComment", no); }
	
	public List<RecipeVO> selectMap(Map<String, Object> map) {
		return sqlSession.selectList("recipe.selectList", map);
	}

	public int getListNum(Map<String, Object> map) {
		return sqlSession.selectOne("recipe.getListNum", map);
	}

}
