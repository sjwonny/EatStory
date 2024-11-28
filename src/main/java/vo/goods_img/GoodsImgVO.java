package vo.goods_img;

import org.springframework.web.multipart.MultipartFile;

public class GoodsImgVO {
	private int no;
	private int goods_no;
	private String img;
	private int seq;
	
	private MultipartFile[] mainImg;
	
	public GoodsImgVO() { }
	
	public GoodsImgVO(int goods_no, String img, int seq) {
		this.goods_no = goods_no;
		this.img = img;
		this.seq = seq;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public MultipartFile[] getMainImg() {
		return mainImg;
	}

	public void setMainImg(MultipartFile[] mainImg) {
		this.mainImg = mainImg;
	}
	
}
