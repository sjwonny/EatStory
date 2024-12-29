package vo.manager.brand;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class BrandVO {
	private int no;
	private String name;
	private String ceo;
	private String email;
	private String report_num;
	private String locat;
	private String phone;
	private String business_num;
	private Date input_date;
	
	private MultipartFile logo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCeo() {
		return ceo;
	}

	public void setCeo(String ceo) {
		this.ceo = ceo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getReport_num() {
		return report_num;
	}

	public void setReport_num(String report_num) {
		this.report_num = report_num;
	}

	public String getLocat() {
		return locat;
	}

	public void setLocat(String locat) {
		this.locat = locat;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBusiness_num() {
		return business_num;
	}

	public void setBusiness_num(String business_num) {
		this.business_num = business_num;
	}

	public MultipartFile getLogo() {
		return logo;
	}

	public void setLogo(MultipartFile logo) {
		this.logo = logo;
	}

	public Date getInput_date() {
		return input_date;
	}

	public void setInput_date(Date input_date) {
		this.input_date = input_date;
	}
	
}
