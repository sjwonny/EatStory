package vo.ingredient;

import java.util.List;

public class IngredientVO {
	private int no;
	private int recipe_no;
	
	private String category;
	private String content;
	private String amount;
	private String categoryArr[];
	private String contentArr[];
	private String amountArr[];
	
	private List<IngredientVO> ingredientVoList;
	
	public IngredientVO() { }

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRecipe_no() {
		return recipe_no;
	}

	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String[] getCategoryArr() {
		return categoryArr;
	}

	public void setCategoryArr(String[] categoryArr) {
		this.categoryArr = categoryArr;
	}

	public String[] getContentArr() {
		return contentArr;
	}

	public void setContentArr(String[] contentArr) {
		this.contentArr = contentArr;
	}

	public String[] getAmountArr() {
		return amountArr;
	}

	public void setAmountArr(String[] amountArr) {
		this.amountArr = amountArr;
	}

	public List<IngredientVO> getIngredientVoList() {
		return ingredientVoList;
	}

	public void setIngredientVoList(List<IngredientVO> ingredientVoList) {
		this.ingredientVoList = ingredientVoList;
	}
	
}
