package javabean;

import java.sql.ResultSet;

public class BusinessBean {
	public boolean valid(String username, String password) {// 登录验证方法
		boolean isValid = false;
		DBAccessBean db = new DBAccessBean();
		if (db.createConn()) {
			String sql = "select * from usertable where username='" + username + "' and password='" + password + "';";
			ResultSet resultSet=db.query(sql);
			try {
				if (resultSet.next()) {
					isValid = true;
				}
				db.closeRs();
				db.closeStmt();
				db.closeConn();
			}catch (Exception e){
				e.printStackTrace();
			}
		}
		return isValid;
	}

	public boolean isExist(String username) {// 检查用户名是否存在
		boolean isExist = false;
		DBAccessBean db = new DBAccessBean();
		if (db.createConn()) {
			String sql = "select * from usertable where username='" + username + "'";
			db.query(sql);
			if (db.next()) {
				isExist = true;
			}
			db.closeRs();
			db.closeStmt();
			db.closeConn();
		}
		return isExist;
	}

	public void add(String username, String password) {// 增加一个用户
		DBAccessBean db = new DBAccessBean();
		if (db.createConn()) {
			String sql = "insert into usertable(username,password) values('" + username + "','" + password + "')";
			db.update(sql);
			db.closeStmt();
			db.closeConn();
		}
	}

}
