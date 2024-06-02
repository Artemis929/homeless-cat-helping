package org.zuel.test.service;

import org.zuel.test.dao.FeedDao;
import org.zuel.test.model.Feed;
import org.zuel.test.util.Dbutil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class FeedService {
    public static List<Integer[]>feedamount()  {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Integer[]> list=new ArrayList<>();
        Integer arr[][]=new Integer[100][3];
        Integer VolunteerID;
        Integer feedAmount;
        Integer rank;

        try {
            conn = Dbutil.getConnection();

            String sql = "select VolunteerID, SUM(Amount) as total_feeding_amount ,RANK() OVER (order by SUM(Amount) DESC) as ranking " +
                    "from Feed  " +
                    "group by VolunteerID " +
                    " order by total_feeding_amount desc ";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            int i=0;
            while(rs.next()&&i<arr.length){
                VolunteerID=rs.getInt("VolunteerID");
                feedAmount=rs.getInt("total_feeding_amount");
                rank=rs.getInt("ranking");
               //arr
               // System.out.println(  VolunteerID+"\t"+feedAmount+"\t"+rank);
                  arr[i]=new Integer[]{rank,VolunteerID,feedAmount};
                  list.add(arr[i]);
                  //System.out.println(Arrays.toString((Integer[]) list.get(i)));
                  i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }return list;
    }
}
