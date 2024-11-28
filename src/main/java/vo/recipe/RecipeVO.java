package vo.recipe;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class RecipeVO {
	private int no;
	private int user_no;
	private String title;
	private String describe;
	private String video;
	private int type_no;
	private int situation_no;
	private int method_no;
	private int ingredient_no;
	private int people_count;
	private int hour;
	private int difficulty;
	private String tips;
	private String tag_list;
	private int hit;
	private Date write_time;
	private int state;
	private double score;

	private MultipartFile main_photo;

	private String users_img;
	private String users_name;
	
	public RecipeVO() { }

	public RecipeVO(String title, String describe, String video) { 
		this.title = title;
		this.describe = describe;
		this.video= video;
	}
	
	public RecipeVO(int no, int user_no, String title, String describe, String video, int type_no, int situation_no, int method_no,
			int ingredient_no, int people_count, int hour, int difficulty, String tips, String tag_list, int hit, Date write_time, int state) {
		this.no = no;
		this.user_no = user_no;
		this.title = title;
		this.describe = describe;
		this.video= video;
		this.type_no = type_no;
		this.situation_no = situation_no;
		this.method_no = method_no;
		this.ingredient_no = ingredient_no;
		this.people_count = people_count;
		this.hour = hour;
		this.difficulty = difficulty;
		this.tips = tips;
		this.tag_list = tag_list;
		this.hit = hit;
		this.write_time = write_time;
		this.state = state;
	}
	
	public RecipeVO(int user_no, String title, String describe, String photo, String video, int type_no, int situation_no, int method_no,
			int ingredient_no, int people_count, int hour, int difficulty, String tips, String tag_list, int hit, Date write_time, int state) {
		this.user_no = user_no;
		this.title = title;
		this.describe = describe;
		this.video= video;
		this.type_no = type_no;
		this.situation_no = situation_no;
		this.method_no = method_no;
		this.ingredient_no = ingredient_no;
		this.people_count = people_count;
		this.hour = hour;
		this.difficulty = difficulty;
		this.tips = tips;
		this.tag_list = tag_list;
		this.hit = hit;
		this.write_time = write_time;
		this.state = state;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public int getType_no() {
		return type_no;
	}

	public void setType_no(int type_no) {
		this.type_no = type_no;
	}

	public int getSituation_no() {
		return situation_no;
	}

	public void setSituation_no(int situation_no) {
		this.situation_no = situation_no;
	}

	public int getMethod_no() {
		return method_no;
	}

	public void setMethod_no(int method_no) {
		this.method_no = method_no;
	}

	public int getIngredient_no() {
		return ingredient_no;
	}

	public void setIngredient_no(int ingredient_no) {
		this.ingredient_no = ingredient_no;
	}

	public int getPeople_count() {
		return people_count;
	}

	public void setPeople_count(int people_count) {
		this.people_count = people_count;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public int getDifficulty() {
		return difficulty;
	}

	public void setDifficulty(int difficulty) {
		this.difficulty = difficulty;
	}

	public String getTips() {
		return tips;
	}

	public void setTips(String tips) {
		this.tips = tips;
	}

	public String getTag_list() {
		return tag_list;
	}

	public void setTag_list(String tag_list) {
		this.tag_list = tag_list;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	
	public double getScore() {
		return score;
	}
	
	public void setScore(double score) {
		this.score = score;
	}

	public MultipartFile getMain_photo() {
		return main_photo;
	}

	public void setMain_photo(MultipartFile main_photo) {
		this.main_photo = main_photo;
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
