package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {
	public MVCBoardDAO() {
		super();
	}
	// 검색 조건에 맞는 게시물의 개수를 반환하는 메서드
	public int selectCount(Map<String, Object> map) { // 게시물 개수 메서드 시작
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM mvcboard";
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement(); 
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1); // 검색된 게시물 개수 저장
		}
		catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	} // selectCount 끝
	// 검색 조건에 맞는 게시물 목록을 반환(페이징 기능 지원)
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) { // 게시물 목록 메서드 시작
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		String query = "select * from mvcboard";
		
		if(map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
			+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY idx DESC limit ?,? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, (int)map.get("start"));
			psmt.setInt(2, (int)map.get("pageSize"));
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				board.add(dto);
			}
		} catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	} // selectListPage끝
	
	// 게시글 데이터를 받아 DB에 추가합니다(파일 업로드 지원)
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query= "INSERT INTO mvcboard (name, title, content, ofile, sfile, pass) "
					 + " VALUES (?, ?, ?, ?, ?, ?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	} // insertWrite 끝
	// 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환
	public MVCBoardDTO selectView(String idx) {
		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "SELECT * FROM mvcboard WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		} catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	} //selectView 끝
	
	public void updateVisitCount(String idx) {
		String query = "UPDATE mvcboard SET "
				+ " visitcount = visitcount+1"
				+ " WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	} // updateVisitCount 끝
} // 클래스 끝
