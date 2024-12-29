package service.users;

import dao.users.UsersDAO;
import vo.users.UsersVO;

public class UsersService {

	private UsersDAO usersDao;

	public UsersService(UsersDAO usersDao) {
		this.usersDao = usersDao;
	}

	public int insert(UsersVO vo) {
		return usersDao.insert(vo);
	}

	public UsersVO selectOne(int no) {
		return usersDao.selectOne(no);
	}

	public int update(UsersVO vo) {
		return usersDao.update(vo);
	}

	public int delete(int no) {
		return usersDao.delete(no);
	}

	public boolean checkId(String id) {
		return usersDao.checkId(id) != null;
	}

	// 이메일 중복 확인 여부
	public boolean checkEmail(String email) {
		return usersDao.checkEmail(email) != null;
	}

	// 전화번호 중복 확인 여부
	public boolean checkPhone(String phone) {
		return usersDao.checkPhone(phone) != null;
	}

	// 비밀번호 재설정
	public int updatePw(String id, String pw) {
		return usersDao.updatePw(id, pw);
	}

	// 이메일 중복 확인
	// 사용자 ID에 해당하는 이메일 반환
	public String getEmailById(int id) {
		UsersVO users = usersDao.selectOne(id);
		if (users != null) {
			return users.getEmail();
		} else {
			return null;
		}
	}
}
