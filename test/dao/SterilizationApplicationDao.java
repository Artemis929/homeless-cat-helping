package org.zuel.test.dao;

import org.zuel.test.model.Cat;
import org.zuel.test.model.Feed;
import org.zuel.test.model.SterilizationApplication;
import org.zuel.test.model.Volunteer;
import org.zuel.test.util.Dbutil;

import java.math.BigDecimal;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class SterilizationApplicationDao {
    public static void insert(SterilizationApplication SterilizationApplication ){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="insert into SterilizationApplication(VolunteerID,CatID,Price,Status)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, SterilizationApplication.getVolunteerID());
            pstmt.setInt(2,SterilizationApplication.getCatID());
            pstmt.setBigDecimal(3,SterilizationApplication.getPrice());
            pstmt.setInt(4,SterilizationApplication.getStatus());
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static List<SterilizationApplication> select (Integer VolunteerID, Integer CatID, BigDecimal Price,Integer Status){
        try{
            String sql="select * from SterilizationApplication where 1=1 ";
            if(VolunteerID !=null)
                sql+="and VolunteerID='"+VolunteerID+"'";
            if(CatID !=null)
                sql+="and CatID='"+CatID+"'";
            if(Price!=null)
                sql+="and Price="+Price+"'";
            if(Status !=null)
                sql+="and Status="+Status+"'";
            sql+=";";
            return fillResult(sql,VolunteerID,CatID,Price,Status);
        }
        catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    private static List<SterilizationApplication>fillResult(String sql,Integer VolunteerID, Integer CatID, BigDecimal Price, Integer Status)throws SQLException, ClassNotFoundException {
        List<SterilizationApplication> sterilizationApplicationList=new LinkedList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = Dbutil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                SterilizationApplication SterilizationApplication=new SterilizationApplication(rs.getInt("VolunteerID"),rs.getInt("CatID"),
                        rs.getBigDecimal("Price"),rs.getInt("Status"));
                sterilizationApplicationList.add(SterilizationApplication);
            }
        }finally {
            Dbutil.release(rs, pstmt, conn);
        }
        return sterilizationApplicationList;
    }
}
