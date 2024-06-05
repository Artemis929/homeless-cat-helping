package org.zuel.test.model;

public class Area {
    private Integer AreaID;
    private String AreaName;
    private String AreaAddress;
    private Integer ManagerID;

    public Area(){}

    public Area(Integer AreaID,String AreaName,String AreaAddress,Integer ManagerID)
    {
        this.AreaID=AreaID;
        this.AreaName=AreaName;
        this.AreaAddress=AreaAddress;
        this.ManagerID=ManagerID;
    }
    public Integer getAreaID(){return AreaID;}
    public void setAreaID(Integer AreaID){this.AreaID=AreaID;}

    public String getAreaName(){return AreaName;}
    public void setAreaName(String AreaName){this.AreaName=AreaName;}

    public String getAreaAddress(){return AreaAddress;}
    public void setAreaAddress(String AreaAddress){this.AreaAddress=AreaAddress;}

    public Integer getManagerID(){return ManagerID;}
    public void setManagerID(Integer ManagerID){this.ManagerID=ManagerID;}

    public String tostring()
    {
        StringBuffer str=new StringBuffer();
        str.append("[AreaID=").append(this.getAreaID()).append(",AreaName=").append(this.getAreaName())
                .append(",AreaAddress=").append(this.getAreaAddress())
                .append(",ManagerID=").append(this.getManagerID()).append("]");
        return str.toString();
    }
}
