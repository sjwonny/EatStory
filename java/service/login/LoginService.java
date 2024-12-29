package service.login;

import dao.users.UsersDAO;
import vo.users.UsersVO;

public class LoginService {

	private UsersDAO usersDao;

	public void setUsersDao(UsersDAO usersDao) {
		this.usersDao = usersDao;
	}

	public int checkLogin(UsersVO vo) {
		return usersDao.checkLogin(vo);
	}

	public String findId(UsersVO vo) {
		return usersDao.findId(vo);
	}

	public String findPw(UsersVO vo) {
		return usersDao.findPw(vo);
	}
}
