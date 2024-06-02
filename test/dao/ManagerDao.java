package org.zuel.test.dao;

import org.zuel.test.model.Manager;
import org.zuel.test.model.Volunteer;
import org.zuel.test.util.Dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ManagerDao {
    public static void update(Integer ManagerID,String ManagerSecret,String ManagerName,String TelephoneNumber){
        Connection conn=null;
        PreparedStatement pstmt=null;
        try{
            conn= Dbutil.getConnection();
            String sql="update Manager set ManagerSecret=?,ManagerName=?,TelephonrNumber=?";
            sql+="where ManagerID=?;";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,ManagerSecret);
            pstmt.setString(2,ManagerName);
            pstmt.setString(3,TelephoneNumber);
            pstmt.setInt(4,ManagerID);
            pstmt.executeUpdate();
        }
        catch(Exception e){
            e.printStackTrace();
        }finally{
            Dbutil.release(pstmt,conn);
        }
    }
    public static List<Manager> select (Integer ManagerID,String ManagerSecret,String ManagerName,String TelephoneNumber){
        try{
            String sql="select * from Manager where 1=1 ";
            if(ManagerID!=null)
                sql+="and ManagerID='"+ManagerID+"'";
            if(ManagerSecret!=null)
                sql+="and ManagerSecret='"+ManagerSecret+"'";
            if(ManagerName!=null)
                sql+="and ManagerName='"+ManagerName+"'";
            if(TelephoneNumber!=null)
                sql+="and TelephoneNumber='"+TelephoneNumber+"'";
            sql+=";";
            return fillResult(sql,ManagerID,ManagerSecret,ManagerName,TelephoneNumber);
        }catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    private static List<Manager> fillResult(String sql,Integer ManagerID,String ManagerSecret,String ManagerName,String TelephoneNumber)throws SQLException, ClassNotFoundException{

        List<Manager> ManagerList=new LinkedList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = Dbutil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Manager Manager=new Manager(rs.getInt("ManagerID"),rs.getString("ManagerSecret"),
                        rs.getString("ManagerName"),rs.getString("TelephoneNumber"));
                ManagerList.add(Manager);
            }
        }finally {
            Dbutil.release(rs, pstmt, conn);
        }
        return ManagerList;
    }
}
