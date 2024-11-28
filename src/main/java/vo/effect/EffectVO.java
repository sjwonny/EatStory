package vo.effect;

public class EffectVO {
	private int no;
	private String effect;
	
	public EffectVO() { }
	
	public EffectVO(String effect) {
		this.effect = effect;
	}
	
	public EffectVO(int no, String effect) {
		this.no = no;
		this.effect = effect;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEffect() {
		return effect;
	}
	public void setEffect(String effect) {
		this.effect = effect;
	}
	
}
