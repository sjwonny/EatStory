package vo.recipe_tag;

public class RecipeTagVO {
	private int no;
	private String recipeTag;
	
	public RecipeTagVO() { }
	
	public RecipeTagVO(String recipeTag) {
		this.recipeTag = recipeTag;
	}
	
	public RecipeTagVO(int no, String recipeTag) {
		this.no = no;
		this.recipeTag = recipeTag;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getrecipeTag() {
		return recipeTag;
	}
	public void setrecipeTag(String recipeTag) {
		this.recipeTag = recipeTag;
	}
	
}
