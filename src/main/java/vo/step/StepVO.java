package vo.step;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class StepVO {
	private int no;
	private int recipe_no;
	private String detail;
	private String img;
	private String ingre;
	private String tool;
	private String fire;
	private String tip;
	
//	private MultipartFile[] step_photo;
	

	private List<StepVO> stepVoList;
	
	public StepVO() { }
	
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getIngre() {
		return ingre;
	}
	public void setIngre(String ingre) {
		this.ingre = ingre;
	}
	public String getTool() {
		return tool;
	}
	public void setTool(String tool) {
		this.tool = tool;
	}
	public String getFire() {
		return fire;
	}
	public void setFire(String fire) {
		this.fire = fire;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public List<StepVO> getStepVoList() {
		return stepVoList;
	}
	public void setStepVoList(List<StepVO> stepVoList) {
		this.stepVoList = stepVoList;
	}
//	public void setStep_photo(MultipartFile[] step_photo) {
//		this.step_photo = step_photo;
//	}
//	public MultipartFile[] getStep_photo() {
//		return step_photo;
//	}
}
