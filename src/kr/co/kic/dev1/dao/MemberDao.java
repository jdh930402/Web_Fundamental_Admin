package kr.co.kic.dev1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.kic.dev1.dto.MemberDto;
import kr.co.kic.dev1.util.ConnLocator;

public class MemberDao {
	private static MemberDao single;

	private MemberDao() {

	}

	public static MemberDao getInstance() {
		if (single == null) {
			single = new MemberDao();
		}
		return single;
	}

	public boolean insert(MemberDto m) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 0;
		try {
			// ds.getConnection()은 이미 만들어진 Connection Pool에 있는 Connection객체를 가저온다.
			// 다시말해서 이 시점에서 Connection객체를 생성하는 것이 아니라 이미 만들어진 Connection객체를 사용하는 것이다.
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("INSERT INTO member(m_seq, m_id, m_email, m_name, m_pwd, m_phone, m_regdate) ");
			sql.append("VALUES(NULL, ?, ?, ?, PASSWORD(?),?, NOW()) ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++index, m.getId());
			pstmt.setString(++index, m.getEmail());
			pstmt.setString(++index, m.getName());
			pstmt.setString(++index, m.getPwd());
			pstmt.setString(++index, m.getPhone());
			pstmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();

				// con객체를 종료하는 것이 아니라 Connection Pool에 Connection객체를 반납한다.
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public boolean update(MemberDto m) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 0;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("UPDATE member ");
			sql.append("SET m_id = ?, m_email = ?, m_name = ?, m_phone = ?, m_regdate = NOW() ");
			sql.append("WHERE m_seq = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++index, m.getId());
			pstmt.setString(++index, m.getEmail());
			pstmt.setString(++index, m.getName());
			pstmt.setString(++index, m.getPhone());
			pstmt.setInt(++index, m.getSeq());
			pstmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();

				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public boolean delete(int seq) {
		boolean isSuccess = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		int index = 0;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("DELETE FROM member ");
			sql.append("WHERE m_seq = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(++index, seq);
			pstmt.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

	public MemberDto select(int seq) {
		MemberDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq, m_id, m_email, m_name, m_phone, date_format(m_regdate,'%Y/%m/%d') ");
			sql.append("FROM member ");
			sql.append("WHERE m_seq = ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(++index, seq);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 0;
				seq = rs.getInt(++index);
				String id = rs.getString(++index);
				String email = rs.getString(++index);
				String name = rs.getString(++index);
				String phone = rs.getString(++index);
				String regdate = rs.getString(++index);
				obj = new MemberDto(seq, id, email, name, phone, regdate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return obj;
	}

	public ArrayList<MemberDto> select(int start, int length) {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq, m_id, m_email, m_name, m_phone, date_format(m_regdate,'%Y/%m/%d') ");
			sql.append("FROM member ");
			sql.append("ORDER BY m_seq DESC ");
			sql.append("LIMIT ?, ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(++index, start);
			pstmt.setInt(++index, length);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				index = 0;
				int seq = rs.getInt(++index);
				String id = rs.getString(++index);
				String email = rs.getString(++index);
				String name = rs.getString(++index);
				String phone = rs.getString(++index);
				String regdate = rs.getString(++index);
				list.add(new MemberDto(seq, id, email, name, phone, regdate));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}

	public String selectJson(int start, int length) {
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;
		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq, m_id, m_email, m_name, m_phone, date_format(m_regdate,'%Y/%m/%d') ");
			sql.append("FROM member ");
			sql.append("ORDER BY m_seq DESC ");
			sql.append("LIMIT ?, ? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(++index, start);
			pstmt.setInt(++index, length);
			rs = pstmt.executeQuery();

			JSONObject item = null;
			while (rs.next()) {
				index = 0;
				item = new JSONObject();
				int seq = rs.getInt(++index);
				String id = rs.getString(++index);
				String email = rs.getString(++index);
				String name = rs.getString(++index);
				String phone = rs.getString(++index);
				String regdate = rs.getString(++index);
				item.put("seq", seq);
				item.put("id", id);
				item.put("email", email);
				item.put("name", name);
				item.put("phone", phone);
				item.put("regdate", regdate);
				jsonArray.add(item);
			}
			jsonObj.put("items", jsonArray);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return jsonObj.toString();
	}

	public int getRows() {
		int count = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT COUNT(m_seq) ");
			sql.append("FROM member ");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 0;
				count = rs.getInt(++index);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return count;
	}

	public boolean isCheckId(String id) {
		boolean isExisted = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;

		con = ConnLocator.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT m_id ");
		sql.append("FROM member ");
		sql.append("WHERE m_id = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++index, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isExisted = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isExisted;
	}

	public boolean isCheckEmail(String email) {
		boolean isExisted = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;

		con = ConnLocator.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT m_email ");
		sql.append("FROM member ");
		sql.append("WHERE m_email = ? ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++index, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isExisted = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isExisted;
	}

	public MemberDto isMember(MemberDto m) {
		MemberDto obj = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int index = 0;

		try {
			con = ConnLocator.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("SELECT m_seq, m_id, m_email, m_name, m_phone, date_format(m_regdate,'%Y/%m/%d') ");
			sql.append("FROM member ");
			sql.append("WHERE m_email = ? AND m_pwd = PASSWORD(?) ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(++index, m.getEmail());
			pstmt.setString(++index, m.getPwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				index = 0;
				int seq = rs.getInt(++index);
				String id = rs.getString(++index);
				String email = rs.getString(++index);
				String name = rs.getString(++index);
				String phone = rs.getString(++index);
				String regdate = rs.getString(++index);
				obj = new MemberDto(seq, id, email, name, phone, regdate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return obj;
	}
}
