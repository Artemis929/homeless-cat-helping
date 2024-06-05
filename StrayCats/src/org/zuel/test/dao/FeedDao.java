package org.zuel.test.dao;

import org.zuel.test.model.Feed;
import org.zuel.test.util.Dbutil;

import java.math.BigDecimal;
import java.sql.*;
import java.util.LinkedList;
import java.util.List;

public class FeedDao {

    public static void insert(Feed Feed) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = Dbutil.getConnection();
            String sql = "insert into Feed(VolunteerID,HomeID,Amount,Price,Date)";
            sql += "values(?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Feed.getVolunteerID());
            pstmt.setInt(2, Feed.getHomeID());
            pstmt.setInt(3, Feed.getAmount());
            pstmt.setBigDecimal(4, Feed.getPrice());
            pstmt.setTimestamp(5, Feed.getDate());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Dbutil.release(pstmt, conn);
        }
    }
    public static List<Feed> select (Integer VolunteerID, Integer HomeID, Integer Amount, BigDecimal Price, Timestamp Date){
        try{
            String sql="select * from Feed where 1=1 ";
            if(VolunteerID !=null)
                sql+="and VolunteerID='"+VolunteerID+"'";
            if(HomeID !=null)
                sql+="and HomeID='"+HomeID+"'";
            if(Amount !=null)
                sql+="and Amount='"+Amount+"'";
            if(Price!=null)
                sql+="and Price="+Price+"'";
            if(Date !=null)
                sql+="and Date="+Date+"'";
            sql+="order by Date DESC";
            sql+=";";
            return fillResult(sql,VolunteerID,HomeID,Amount,Price,Date);
        }
        catch (Exception e) {
            e.printStackTrace();
            return new LinkedList<>();
        }
    }
    private static List<Feed>fillResult(String sql,Integer VolunteerID, Integer HomeID, Integer Amount, BigDecimal Price, Timestamp Date)throws SQLException, ClassNotFoundException {
        List<Feed> feedList = new LinkedList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = Dbutil.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Feed Feed = new Feed(rs.getInt("VolunteerID"), rs.getInt("HomeID"), rs.getInt("Amount"),
                        rs.getBigDecimal("Price"), rs.getTimestamp("Date"));
                feedList.add(Feed);
            }
        } finally {
            Dbutil.release(rs, pstmt, conn);
        }
        return feedList;
    }
}
