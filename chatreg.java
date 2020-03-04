package chatroom;

//ÓÃ»§×¢²áÓÃµ½µÄbeanÎÄ¼þ
import java.sql.*;
public class chatreg {
	static String sDBDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String sConnStr = "jdbc:sqlserver://127.0.0.1:1433;DatabaseName=chatroom";
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt;
	
	public chatreg() {
		try {
			Class.forName(sDBDriver);
			//conn = DriverManager.getConnection(sConnStr);
			conn = DriverManager.getConnection(sConnStr, "root", "");
			stmt = conn.createStatement();
		} catch(java.lang.ClassNotFoundException e) {
			System.err.println("chatreg(): " + e.getMessage());
		} catch(java.sql.SQLException e) {
			System.err.println("chatreg(): " + e.getMessage());
		}
	}
	
	public ResultSet executeQuery(String sql) {
		rs = null;
		try {
			if(conn==null) {
				//conn = DriverManager.getConnection(sConnStr);
				conn = DriverManager.getConnection(sConnStr, "root", "");
				stmt = conn.createStatement();
			}
			rs = stmt.executeQuery(sql);
		} catch(SQLException e) {
			System.err.println(e.getMessage());
		}
		return rs;
	}
	
	public boolean executeUpdate(String sql) {
		boolean success = false;
		try {
			if(conn==null) {
				//conn = DriverManager.getConnection(sConnStr);
				conn = DriverManager.getConnection(sConnStr, "root", "");
				stmt = conn.createStatement();
			}
			stmt.executeUpdate(sql);
			success = true;
		} catch(SQLException e) {
			success = false;
		}
		return success;
	}
	
	public void close() {
		try {
			if(!conn.isClosed()) conn.close();
			conn = null;
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
