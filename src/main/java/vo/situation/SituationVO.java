package vo.situation;

public class SituationVO {
	private int no;
	private String situation;
	
	public SituationVO() { }
	
	public SituationVO(String situation) {
		this.situation = situation;
	}
	
	public SituationVO(int no, String situation) {
		this.no = no;
		this.situation = situation;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getsituation() {
		return situation;
	}
	public void setsituation(String situation) {
		this.situation = situation;
	}
	
}
