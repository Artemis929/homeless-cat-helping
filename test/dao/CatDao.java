package org.zuel.test.dao;

import org.zuel.test.model.Cat;
import org.zuel.test.util.Dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class CatDao {

    public static void insert(Cat cat){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try {
            conn = Dbutil.getConnection();
            String sql = "insert into Cat(CatID,CatName,Sex,Characteristic,LivingStatus,SterilizationStatus,AreaID)";
            sql += "values(?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, cat.getCatID());
            pstmt.setString(2, cat.getCatName());
            pstmt.setString(3, cat.getSex());
            pstmt.setString(4, cat.getCharacteristic());
            pstmt.setString(5, cat.getLivingStatus());
            pstmt.setInt(6, cat.getSterilizationStatus());
            pstmt.setInt(7, cat.getAreaID());
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static void update(Integer CatID,String CatName,String Sex,String Characteristic,
                              String LivingStatus,Integer SterilizationStatus,Integer AreaID){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="update Cat set CatName=?,Sex=?,Characteristic=?,LivingStatus=?,SterilizationStatus=?,AreaID=?";
            sql+=" where CatID=?";
            pstmt=conn.prepareStatement(sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,CatName );
            pstmt.setString(2, Sex);
            pstmt.setString(3,Characteristic);
            pstmt.setString(4,LivingStatus);
            pstmt.setInt(5,SterilizationStatus);
            pstmt.setInt(6,AreaID);
            pstmt.setInt(7,CatID );
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            Dbutil.release(pstmt, conn);
        }
    }
    public static void delete(Integer CatID){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="delete from Cat where CatID=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,CatID);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static List<Cat> select (Integer CatID,String CatName,String Sex,String Characteristic,
                                    String LivingStatus,Integer SterilizationStatus,Integer AreaID) {
        try {
            String sql = "select * from Cat where 1=1";
            if (CatID != null)
                sql += " and CatID='" + CatID + "'";
            if (CatName != null)
                sql += " and CatName='" + CatName + "'";
            if (Sex != null)
                sql += " and Sex='" + Sex + "'";
            if (Characteristic != null)
                sql += " and Characteristic='" + Characteristic + "'";
            if (LivingStatus != null)
                sql += " and LivingStatus='" + LivingStatus + "'";
            if (SterilizationStatus != null)
                sql += " and SterilizationStatus='" + SterilizationStatus + "'";
            if (AreaID != null)
                sql += " and AreaID='" + AreaID + "'";
            sql += ";";
            return fillResult(sql, CatID, CatName, Sex, Characteristic, LivingStatus, SterilizationStatus, AreaID);
        } catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    private static List<Cat> fillResult(String sql,Integer CatID,String CatName,String Sex,String Characteristic,
                                       String LivingStatus,Integer SterilizationStatus,Integer AreaID)throws SQLException, ClassNotFoundException  {
        List<Cat> catList = new LinkedList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = Dbutil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Cat cat = new Cat(rs.getInt("CatID"), rs.getString("CatName")
                        , rs.getString("Sex"), rs.getString("Characteristic")
                        , rs.getString("LivingStatus"), rs.getInt("SterilizationStatus")
                        , rs.getInt("AreaID"));
                catList.add(cat);
            }
        } finally {
            Dbutil.release(rs, pstmt, conn);
        }
        return catList;
    }
}
