package day1210;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public static void main(String[] args) {

		// DB설치를 위해서는 먼저 Driver가 필요하다.
		// forName을 이용해서 필요한 driver를 찾아깔면된다. 
		
		
		
		//-----------Driver 설치-----------------
		try {
			Class.forName("oracle.jdbc.OracleDriver").getDeclaredConstructor().newInstance();
			System.out.println("Installed Driver !");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		//-----------Orcle DB연결-----------------
		String url="jdbc:oracle:thin:@localhost:1521:XE";
		String user="layla";
		String password="oracle";
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(url, user, password);
			System.out.println("Connected to DB !");
			
			//=================연결한 DB에 쿼리 적용해보기=================
			Statement st;
			st=conn.createStatement();
			
			
			String sql="insert into board "		// 띄워쓰기 주의!
					+ "values(seq_board.nextval, 'test', 'test내용', sysdate, 0, '작성자') ";
			int n=st.executeUpdate(sql);
			st.executeUpdate(sql);
			st.close();
			conn.close();
			System.out.println(n+"개 SQL 업데이트 완료");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}
}
