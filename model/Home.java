package org.zuel.test.model;

public class Home {
    private Integer HomeID;
    private String HomeAddress;
    private Integer AreaID;

    public Home(){}
    public Home(Integer HomeID,String HomeAddress,Integer AreaID)
    {
        this.HomeID=HomeID;
        this.HomeAddress=HomeAddress;
        this.AreaID=AreaID;
    }
    public Integer getHomeID(){return HomeID;}
    public void setHomeID(Integer HomeID){this.HomeID=HomeID;}

    public String getHomeAddress(){return HomeAddress;}
    public void setHomeAddress(String HomeAddress){this.HomeAddress=HomeAddress;}

    public Integer getAreaID(){return AreaID;}
    public void setAreaID(Integer AreaID){this.AreaID=AreaID;}

    public String tostring()
    {
        StringBuffer str=new StringBuffer();
        str.append("[HomeID=").append(this.getHomeID())
                .append(",HomeAddress=").append(this.getHomeAddress())
                .append(",AreaID=").append(this.getAreaID())
                .append("]");
        return str.toString();
    }
}
