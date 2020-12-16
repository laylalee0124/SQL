package Controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;



//서블릿에 선언하는것 대신, 아래와 같이 어노테이션에 선언해서 쓰는게 최근방식
@WebServlet(urlPatterns = {"*.me", "*.do"})



// Servlet은 data처리를 위해서 준비된 class
// webcontainer에 등록해놓고 입력을 대기시켜야한다.
public class MemberController extends HttpServlet {

	// version 관리
	private static final long serialVersionUID = 1L;
     
	public void insertMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// 읽어오는 정보에 한글이있을경우를 위해 인코딩 셋팅
				request.setCharacterEncoding("utf-8");
						
				// httpServletRequest request에서 클라이언트에서 넘겨준 데이터 읽어 들임.
				String email=request.getParameter("email");
				String pw=request.getParameter("pw");
				String name=request.getParameter("name");
				
				System.out.println("email: "+email);
				System.out.println("pw: "+pw);
				System.out.println("name: "+name);
				
				
				// DB driver 설치
				// jdbc driver 6 설치해서, [WEB-INF]-[lib]내에 복붙해넣기
				// [java resource]-[libraries]-[web app libraris]-[ojbdc5.jar]-[oracle.jdbc]-[oracledriver.class]내의 class파일경로 복사해서 아래에 붙여넣기.
				try {
					Class.forName("oracle.jdbc.OracleDriver").getDeclaredConstructor().newInstance();
					System.out.println("Driver 설치 완료");
				} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
					e.printStackTrace();
				}
				
				// DB 접속
				String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
				String user="layla";
				String password="layla";
				
				PreparedStatement pstmt=null;
				Connection conn=null;
				try {
					// 객체 생성
					conn=DriverManager.getConnection(url, user, password);
					
					
					// DB에 들어갈 쿼리문
					String sql="insert into member(email, pw, name) values(?, ?, ?)";
					pstmt=conn.prepareStatement(sql);
					
					// method이용하여 String으로 정보받음
					pstmt.setString(1, email);
					pstmt.setString(2, pw);
					pstmt.setString(3, name);
					pstmt.executeUpdate();
							
				} catch (SQLException e) {
					System.out.println("DB 접속 또는 쿼리 실행시 오류 발생");
					e.printStackTrace();
				}finally {
					// 종료
					try {
						if(pstmt !=null) pstmt.close();
						if(conn !=null) conn.close();
					} catch (SQLException e) {
						System.out.println("close시 오류가 발생했습니다.");
						e.printStackTrace();
					}
				}
	}
	
    public MemberController() {
        super();
    }

    
    private void selectAllMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1. DB에 접속
    	//---Driver 설치-----
    	try {
			Class.forName("oracle.jdbc.OracleDriver").getDeclaredConstructor().newInstance();
			System.out.println("Driver 설치 완료");
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException | NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
		}
		
		//-----DB 접속--------
		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String user="layla";
		String password="layla";
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		try {
			// 객체 생성
			conn=DriverManager.getConnection(url, user, password); //접속완료
			System.out.println("DB접속 완료");
			
			// DB에 들어갈 쿼리문 (select명령문으로 정보가저오기)
			String sql="SELECT * from member";
			pstmt=conn.prepareStatement(sql);
			
			// select로 선택한 query를 리턴해주는 method : returns a single ResultSet object
			ResultSet rs=pstmt.executeQuery();
			
			// DTO정보를 입력해줄 collection 공간을 미리 만들어줌
			List<MemberDTO> list=new Vector<MemberDTO>();
			
			while(rs.next()) {	// .next()는 유효한 데이터줄이 있으면 읽을 위치로 이동.
				// .next()로 이동한 위치에서부터 아래 내용을 각각 읽어서 각 변수에 저장.
				String email=rs.getString("email");
				String pw=rs.getString("pw");
				String name=rs.getString("name");
				
				// ex) 1번줄의 데이터 셋트를 읽어와서 MemberDTO에 저장해줄것이기 때문에
				// MemberDTO안에는 아까 정해놓은 email/pw/name의 변수가 이미 private로 지정돼잇음.
				// 따라서 MemberDTO를 객채화하여, set method를 이용해서 private  email/pw/name 변수안에 정보를 저장해준다.
				MemberDTO dto=new MemberDTO();
					dto.setEmail(email);
					dto.setPw(pw);
					dto.setName(name);
				// 셋팅된 정보를 collection(list)에 저장시켜줌 (블록밖으로 나가면 remove되기때문에)
				list.add(dto);
			}
			
			// collection(list)에 저장된 DTO 정보를 page로 보내서 출력시킴
			request.setAttribute("list",  list);
					
		} catch (SQLException e) {
			System.out.println("DB 접속 또는 쿼리 실행시 오류 발생");
			e.printStackTrace();
			
		}finally {
			// 종료
			try {
				if(pstmt !=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				System.out.println("close시 오류가 발생했습니다.");
				e.printStackTrace();
			}
		}
    	
    	// 3. 정보를 표현할 페이지로 이동해서 표현해주기
		// RequestDispatcher & getRequestDispatcher = Returns a RequestDispatcher object that acts as a wrapper forthe resource located at the given path
		RequestDispatcher rd=request.getRequestDispatcher("memberList.jsp");
    	rd.forward(request, response);
    }
    
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 시작");
		
		//------요청받은 URI정보 가지고옴------------
		// uri는 내 현재폴더내의 주소
		// url은 범세계적인 것.
		String uri=request.getRequestURI();
		System.out.println("uri: "+uri); 
		// uri: /Day1216_/memberList.me
		
		StringBuffer url=request.getRequestURL();
		System.out.println("url: "+url);
		// url: http://localhost:8080/Day1216_/memberList.me
		
		
		//--------URI정보로 요구분석------------
		// URI가 ""이면 멤버 정보 method실행
		if(uri.equals("/Day1216_/memberReg.me")) {
			insertMember(request, response);
		
		// URI가 ""이면 멤버 정보 조회 해서 보여주기
		}else if (uri.equals("/Day1216_/memberList.me")){
			selectAllMember(request, response);
			System.out.println("정보보여주는 서비스 실행!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost 시작");
		doGet(request, response);
	}

}
