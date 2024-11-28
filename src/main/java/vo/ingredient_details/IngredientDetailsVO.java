package vo.ingredient_details;

public class IngredientDetailsVO {
	private int no;
	private String icon;
	private String name;
	private String description;
	private String season;
	private String temper;
	private String calory;
	private String match;
	private String unmatch;
	private int effect_no;
	private String buy_tip;
	private String prep_tip;
	private String cook_tip;
	private String recipe_link;
	private String storage_tip;
	
	public IngredientDetailsVO() { }

	public IngredientDetailsVO(int no, String icon, String name, String description, String season, String temper, String calory, String match, String unmatch, int effect_no,
			String buy_tip, String prep_tip, String cook_tip, String recipe_link, String storage_tip) {
		this.no = no;
		this.icon = icon;
		this.name = name;
		this.description = description;
		this.season = season;
		this.temper = temper;
		this.calory = calory;
		this.match = match;
		this.unmatch = unmatch;
		this.effect_no = effect_no;
		this.buy_tip = buy_tip;
		this.prep_tip = prep_tip;
		this.cook_tip = cook_tip;
		this.recipe_link = recipe_link;
		this.storage_tip = storage_tip;
	}
	
	public IngredientDetailsVO(String icon, String name, String description, String season, String temper, String calory, String match, String unmatch, int effect_no,
			String buy_tip, String prep_tip, String cook_tip, String recipe_link, String storage_tip) {
		this.icon = icon;
		this.name = name;
		this.description = description;
		this.season = season;
		this.temper = temper;
		this.calory = calory;
		this.match = match;
		this.unmatch = unmatch;
		this.effect_no = effect_no;
		this.buy_tip = buy_tip;
		this.prep_tip = prep_tip;
		this.cook_tip = cook_tip;
		this.recipe_link = recipe_link;
		this.storage_tip = storage_tip;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getTemper() {
		return temper;
	}
	public void setTemper(String temper) {
		this.temper = temper;
	}
	public String getCalory() {
		return calory;
	}
	public void setCalory(String calory) {
		this.calory = calory;
	}
	public String getMatch() {
		return match;
	}
	public void setMatch(String match) {
		this.match = match;
	}
	public String getUnmatch() {
		return unmatch;
	}
	public void setUnmatch(String unmatch) {
		this.unmatch = unmatch;
	}
	public int getEffect_no() {
		return effect_no;
	}
	public void setEffect_no(int effect_no) {
		this.effect_no = effect_no;
	}
	public String getBuy_tip() {
		return buy_tip;
	}
	public void setBuy_tip(String buy_tip) {
		this.buy_tip = buy_tip;
	}
	public String getPrep_tip() {
		return prep_tip;
	}
	public void setPrep_tip(String prep_tip) {
		this.prep_tip = prep_tip;
	}
	public String getCook_tip() {
		return cook_tip;
	}
	public void setCook_tip(String cook_tip) {
		this.cook_tip = cook_tip;
	}
	public String getRecipe_link() {
		return recipe_link;
	}
	public void setRecipe_link(String recipe_link) {
		this.recipe_link = recipe_link;
	}
	public String getStorage_tip() {
		return storage_tip;
	}
	public void setStorage_tip(String storage_tip) {
		this.storage_tip = storage_tip;
	}
	
}
