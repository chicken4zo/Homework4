package kr.or.bit.dao;

import kr.or.bit.dto.KoreaMemberDto;
import kr.or.bit.utils.ConnectionHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KoreaMemberDao {
    public int insertKoreanMember(KoreaMemberDto koreaMemberDto) {
        Connection conn = null;
        int resultRow = 0;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionHelper.getConnection("oracle");

            String sql = "insert into koreamember(id,pwd,name,age,gender,email,ip) values(?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, koreaMemberDto.getId());
            pstmt.setString(2, koreaMemberDto.getPwd());
            pstmt.setString(3, koreaMemberDto.getName());
            pstmt.setInt(4, koreaMemberDto.getAge());
            pstmt.setString(5, koreaMemberDto.getGender());
            pstmt.setString(6, koreaMemberDto.getEmail());
            pstmt.setString(7, koreaMemberDto.getIp());

            resultRow = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return resultRow;
    }

    public KoreaMemberDto loginId(String id) {
        Connection conn = null;//추가
        String loginId = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        KoreaMemberDto dto = null;
        try {
            conn = ConnectionHelper.getConnection("oracle");//추가
            String sql = "select id,pwd from KoreaMember where id=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = new KoreaMemberDto();
                dto.setId(rs.getString("id"));
                dto.setPwd(rs.getString("pwd"));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }
        return dto;
    }


    public int deleteMember(String id) {

        Connection conn = null;
        int resultrow = 0;
        PreparedStatement pstmt = null;

        try {
            conn = ConnectionHelper.getConnection("oracle");//추가

            String sql = "delete from koreaMember where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);


            resultrow = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println("Delete : " + e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
            try {
                conn.close(); //반환하기
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return resultrow;
    }

    //멤버 상세 페이지
    public KoreaMemberDto detailMember(String id) {

        KoreaMemberDto kdto = new KoreaMemberDto();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select id,pwd,name,age,gender,email from koreamember where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);


            rs = pstmt.executeQuery();
            //rs.next(); 추후에 데이터 1건 경우  (while 없이 )

            while (rs.next()) {


                kdto.setId(rs.getString("id"));
                kdto.setPwd(rs.getString("pwd"));
                kdto.setName(rs.getString("name"));
                kdto.setAge(rs.getInt("age"));
                kdto.setGender(rs.getNString("gender"));
                kdto.setEmail(rs.getString("email"));

            }


        } catch (Exception e) {
            System.out.println(e.getMessage());

        } finally {
            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }
        return kdto;
    }


    //여러명의 멤버 데이터 불러오기
    public KoreaMemberDao getMemoListById(String id) {

        return null;
    }


    // edit
    public int editMember(KoreaMemberDto kdto) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int resultrow = 0;

        try {
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "update koreamember set name=? , age=? , email=? , gender=? where id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, kdto.getName());
            pstmt.setInt(2, kdto.getAge());
            pstmt.setString(3, kdto.getEmail());
            pstmt.setString(4, kdto.getGender());
            pstmt.setString(5, kdto.getId());
            resultrow = pstmt.executeUpdate();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }
        return resultrow;
    }

    public ArrayList<KoreaMemberDto> memberList() throws SQLException {

        Connection conn = ConnectionHelper.getConnection("oracle"); // 객체 얻기
        PreparedStatement pstmt = null;
        String sql = "select id, ip from koreaMember";
        pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        ArrayList<KoreaMemberDto> memberList = new ArrayList<>();
        while (rs.next()) {
            KoreaMemberDto memberDto = new KoreaMemberDto();
            memberDto.setId(rs.getString("id"));
            memberDto.setIp(rs.getString("ip"));
            memberList.add(memberDto);

        }

        ConnectionHelper.close(rs);
        ConnectionHelper.close(pstmt);
        ConnectionHelper.close(conn); // 반환하기

        return memberList;
    }


    // 조건 검색
    public ArrayList<KoreaMemberDto> searchList(String name) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        conn = ConnectionHelper.getConnection("oracle");
        String sql = "select count(*) from koreaMember where name like ?";
        String sql2 = "select id, name, email from koreaMember where name like '%" + name + "%'";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, '%' + name + '%');
        rs = pstmt.executeQuery();
        int rowcount = 0;

        ArrayList<KoreaMemberDto> searchList = new ArrayList<>();
        if (rs.next()) {
            rowcount = rs.getInt(1); //조회건수

            if (rowcount > 0) {
                pstmt = conn.prepareStatement(sql2);
                rs = pstmt.executeQuery();

                while (rs.next()) {

                    KoreaMemberDto memberDto = new KoreaMemberDto();
                    memberDto.setId(rs.getString(1));
                    memberDto.setName(rs.getString(2));
                    memberDto.setEmail(rs.getString(3));

                    searchList.add(memberDto);
                }

            }

            ConnectionHelper.close(rs);
            ConnectionHelper.close(pstmt);
            ConnectionHelper.close(conn);
        }
        return searchList;
    }
}
