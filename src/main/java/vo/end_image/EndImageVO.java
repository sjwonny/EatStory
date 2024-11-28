package vo.end_image;

import org.springframework.web.multipart.MultipartFile;

public class EndImageVO {
	private int no;
	private String img;
	private int recipe_no;
	
	private MultipartFile[] end_image;
	
	public EndImageVO() { }
	
	public EndImageVO(String img, int recipe_no) {
		this.img = img;
		this.recipe_no = recipe_no;
	}
	
	public EndImageVO(int no, String img, int recipe_no) {
		this.no = no;
		this.img = img;
		this.recipe_no = recipe_no;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getRecipe_no() {
		return recipe_no;
	}
	public void setRecipe_no(int recipe_no) {
		this.recipe_no = recipe_no;
	}
	public MultipartFile[] getEnd_image() {
		return end_image;
	}
	public void setEnd_image(MultipartFile[] end_image) {
		this.end_image = end_image;
	}
}
