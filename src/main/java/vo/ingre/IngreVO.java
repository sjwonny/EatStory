package vo.ingre;

public class IngreVO {
	private int no;
	private String ingre;
	
	public IngreVO() { }
	
	public IngreVO(String ingre) {
		this.ingre = ingre;
	}
	
	public IngreVO(int no, String ingre) {
		this.no = no;
		this.ingre = ingre;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getingre() {
		return ingre;
	}
	public void setingre(String ingre) {
		this.ingre = ingre;
	}
	
}
