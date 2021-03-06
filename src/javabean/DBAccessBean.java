package javabean;

import java.lang.reflect.InvocationTargetException;
import java.sql.*;

public class DBAccessBean {
	private String drv = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/liaoqing?serverTimezone=UTC&useUnicode=true" +
			"&characterEncoding=UTF-8&useSSL=false&allowPublicKeyRetrieval=true";
	private String usr = "root";
	private String pwd = "xingqing111129";
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	public String getDrv() {
		return drv;
	}

	public void setDrv(String drv) {
		this.drv = drv;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUsr() {
		return usr;
	}

	public void setUsr(String usr) {
		this.usr = usr;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Statement getStmt() {
		return stmt;
	}

	public void setStmt(Statement stmt) {
		this.stmt = stmt;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}

	public boolean createConn() {//创建数据库连接
		boolean b = false;
		try {
			Class.forName(drv).getDeclaredConstructor().newInstance();
			conn = DriverManager.getConnection(url, usr, pwd);
			if (conn!=null)
				b = true;
		}catch (Exception e){
			e.printStackTrace();
		}
		return b;
	}

	public boolean update(String sql) {//更新数据库内容的sql方法
		boolean b = false;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
			b = true;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return b;
	}

	public ResultSet query(String sql) {//查询数据库内容的sql方法
		try{
			PreparedStatement preparedStatement=conn.prepareStatement(sql);
			rs=preparedStatement.executeQuery();
		}catch(Exception e){
			e.printStackTrace();
		}
		return rs;
	}

	public boolean next(){//移到下条记录
		boolean b = false;
		try{
			if(rs.next())
				b=true;
		}catch(Exception e){}
		return b;
	}

	public  String getValue(String field){//取得当前记录的字段field的值
		String value = null;
		try{
			if (rs!=null)
				value =rs.getString(field);
		}catch (Exception e){}
		return value;
	}

	//关闭与数据库连接相关的三个对象
	public  void closeConn(){
		try{
			if(conn!=null)
				conn.close();
		}catch(SQLException e){}
	}

	public void closeStmt(){
		try{
			if(stmt != null)
				stmt.close();
		}catch(SQLException e){}
	}

	public void closeRs(){
		try{
			if(rs!=null)
				rs.close();
		}catch(SQLException e){}
	}

}
