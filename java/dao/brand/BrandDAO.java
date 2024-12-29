package dao.brand;

import java.util.List;



import org.apache.ibatis.session.SqlSession;

import vo.manager.brand.BrandVO;

public class BrandDAO {

	private SqlSession sqlSession;
	
	public BrandDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<BrandVO> selectList() {
		return sqlSession.selectList("brand.selectList");
	}
	
	
	  public BrandVO selectBrandName(int no) { return
	  sqlSession.selectOne("brand.selectBrandName", no); }
	 
}
