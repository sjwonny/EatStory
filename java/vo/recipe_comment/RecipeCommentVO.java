package vo.recipe_comment;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class RecipeCommentVO {
	private int no;
	private int recipe_no;
	private int comment_no;
	private String detail;
	private String img;
	private Date write_date;
	private int users_no;
	
	private MultipartFile image;
	
	private String users_img;
	private String users_name;

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

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getUsers_no() {
		return users_no;
	}

	public void setUsers_no(int users_no) {
		this.users_no = users_no;
	}

	public MultipartFile getImage() {
		return image;
	}

	public void setImage(MultipartFile image) {
		this.image = image;
	}

	public String getUsers_img() {
		return users_img;
	}

	public void setUsers_img(String users_img) {
		this.users_img = users_img;
	}

	public String getUsers_name() {
		return users_name;
	}

	public void setUsers_name(String users_name) {
		this.users_name = users_name;
	}
	
}
