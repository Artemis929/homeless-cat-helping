package org.zuel.test.dao;

import org.zuel.test.model.Cat;
import org.zuel.test.model.Home;
import org.zuel.test.util.Dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class HomeDao {
    public static void insert(Home Home){
            Connection conn=null;
            PreparedStatement pstmt=null;
            try{
                conn= Dbutil.getConnection();
                String sql="insert into Home(HomeID,HomeAddress,AreaID)";
                sql+="values(?,?,?)";
                pstmt=conn.prepareStatement(sql);
                pstmt.setInt(1,Home.getHomeID());
                pstmt.setString(2,Home.getHomeAddress());
                pstmt.setInt(3,Home.getAreaID());
                pstmt.executeUpdate();
            }catch(Exception e){
                e.printStackTrace();
            }finally{
                Dbutil.release(pstmt,conn);
            }
    }
    public void update(Integer HomeID,String HomeAddress,Integer AreaID){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try {
            conn = Dbutil.getConnection();
            String sql = "update Home set HomeAddress=?,AreaID=?";
            sql += " where HomeID=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, HomeAddress);
            pstmt.setInt(2, AreaID);
            pstmt.setInt(3, HomeID);
            pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static void delete(Integer HomeID){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="delete from Home where HomeID=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,HomeID);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static List<Home> select (Integer HomeID,String HomeAddress,Integer AreaID) {
        try {
            String sql = "select * from Home where 1=1";
            if (HomeID != null)
                sql += " and HomeID='" + HomeID + "'";
            if (HomeAddress != null)
                sql += " and HomeAddress='" + HomeAddress + "'";
            if (AreaID != null)
                sql += " and AreaID='" + AreaID + "'";
            sql += ";";
            return fillResult(sql,HomeID,HomeAddress,AreaID);
        } catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    private static List<Home> fillResult(String sql,Integer HomeID,String HomeAddress,Integer AreaID)throws SQLException, ClassNotFoundException  {
        List<Home> homeList = new LinkedList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = Dbutil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Home home = new Home(rs.getInt("HomeID"), rs.getString("HomeAddress")
                        , rs.getInt("AreaID")
                        );
                homeList.add(home);
            }
        } finally {
            Dbutil.release(rs, pstmt, conn);
        }
        return homeList;
    }
}
