package org.zuel.test.dao;

import org.zuel.test.model.Volunteer;
import org.zuel.test.util.Dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class VolunteerDao {
    public static void insert(Volunteer Volunteeer){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="insert into Volunteer(VolunteerID,VolunteerSecret,VolunteerName)";
            sql+="values(?,?,?);";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,Volunteeer.getVolunteerID());
            pstmt.setString(2,Volunteeer.getVolunteerSecret());
            pstmt.setString(3,Volunteeer.getVolunteerName());
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static void update(Integer VolunteerID,String VolunteerSecret,String VolunteerName){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="update Volunteer set VolunteerSecret=?,VolunteerName=?";
            sql+="where VolunteerID=?;";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,VolunteerSecret);
            pstmt.setString(2,VolunteerName);
            pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static void delete(Integer VolunteerID){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="delete from Volunteer where VolunteerID=?;";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,VolunteerID);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static List<Volunteer> select (Integer VolunteerID,String VolunteerSecret,String VolunteerName){
        try{
            String sql="select * from Volunteer where 1=1 ";
            if(VolunteerID!=null)
                sql+="and VolunteerID='"+VolunteerID+"'";
            if(VolunteerSecret!=null)
                sql+="and VolunteerSecret='"+VolunteerSecret+"'";
            if(VolunteerName!=null)
                sql+="and VolunteerName='"+VolunteerName+"'";
            sql+=";";
            return fillResult(sql,VolunteerID,VolunteerSecret,VolunteerName);
        }catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    private static List<Volunteer> fillResult(String sql,Integer VolunteerID,String VolunteerSecret,String VolunteerName)throws SQLException, ClassNotFoundException{

            List<Volunteer> VolunteerList=new LinkedList<>();
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                conn = Dbutil.getConnection();
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    Volunteer Volunteer=new Volunteer(rs.getInt("VolunteerID"),rs.getString("VolunteerSecret"),
                            rs.getString("VolunteerName"));
                    VolunteerList.add(Volunteer);
                }
            }finally {
                Dbutil.release(rs, pstmt, conn);
            }
            return VolunteerList;
    }
}