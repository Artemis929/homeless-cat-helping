package org.zuel.test.dao;

import org.zuel.test.model.Area;
import org.zuel.test.util.Dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class AreaDao {
    public static void insert(Area Area){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="insert into Area(AreaID,AreaName,AreaAddress,ManagerID)";
            sql+="values(?,?,?,?);";
            pstmt.setInt(1,Area.getAreaID());
            pstmt.setString(2,Area.getAreaName());
            pstmt.setString(3,Area.getAreaAddress());
            pstmt.setInt(4,Area.getManagerID());
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }

    public static void update(Integer AreaID,String AreaName,String AreaAddress,Integer ManagerID)
    {
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="update Area set AreaID=?,AreaName=?,AreaAddress=?,ManagerID=?";
            sql+=" where AreaID=?;";
            pstmt.setInt(4,AreaID);
            pstmt.setString(1,AreaName);
            pstmt.setString(2,AreaAddress);
            pstmt.setInt(3,ManagerID);
            pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }

    public static void delete(Integer AreaID){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="delete from Area where AreaID=?;";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,AreaID);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static List<Area> select(Integer AreaID,String AreaName,String AreaAddress,Integer ManagerID) {
        try {
            String sql = "select * from Area where 1=1 ";
            if (AreaID != null) {
                sql += "and AreaID ='" + AreaID + "'";
            }
            if (AreaName != null) {
                sql += "and AreaName='" + AreaName + "'";
            }
            if (AreaAddress != null) {
                sql += "and AreaAddress='" + AreaAddress + "'";
            }
            if (ManagerID != null) {
                sql += "and ManagerID='" + ManagerID + "'";
            }
            sql += ";";
            return fillResult(sql, AreaID, AreaName, AreaAddress, ManagerID);
        } catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }

    private static List<Area> fillResult(String sql,Integer AreaID,String AreaName,String AreaAddress,Integer ManagerID)throws SQLException, ClassNotFoundException {
            List<Area> arealist =new LinkedList<>();
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try{
                conn = Dbutil.getConnection();
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while(rs.next()){
                    Area area =new Area(rs.getInt("AreaID"),rs.getString("AreaName")
                    ,rs.getString("AreaAddress"),rs.getInt("ManagerID"));
                     arealist.add(area);//
                }
            }finally{
                Dbutil.release(rs,pstmt,conn);
            }
            return arealist;
        }
}


