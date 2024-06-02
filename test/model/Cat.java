package org.zuel.test.model;

import java.awt.geom.Area;

public class Cat {
    private Integer CatID;
    private String CatName;
    private String Sex;//'M' 表示雄性，'F' 表示雌性,‘N’表示未知
    private String Characteristic;
    private String LivingStatus;
    private Integer SterilizationStatus;//0表示未绝育，1表示已绝育
    private Integer AreaID;

    public Cat(){}

    public Cat(Integer CatID,String CatName,String Sex,String Characteristic,
               String LivingStatus,Integer SterilizationStatus,Integer AreaID)
    {
        this.CatID=CatID;
        this.CatName=CatName;
        this.Sex=Sex;
        this.Characteristic=Characteristic;
        this.LivingStatus=LivingStatus;
        this.SterilizationStatus=SterilizationStatus;
        this.AreaID=AreaID;
    }

    public Integer getCatID(){return CatID;}
    public void setCatID(int CatID){this.CatID=CatID;}

    public String getCatName(){return CatName;}
    public void setCatName(String CatName){this.CatName=CatName;}

    public String getSex(){return Sex;}
    public void setSex(String Sex){this.Sex=Sex;}

    public String getCharacteristic(){return Characteristic;}
    public void setCharacteristic(String Characteristic){this.Characteristic=Characteristic;}

    public String getLivingStatus(){return LivingStatus;}
    public void setLivingStatus(String LivingStatus){this.LivingStatus=LivingStatus;}

    public Integer getSterilizationStatus(){return SterilizationStatus;}
    public void setSterilizationStatus(Integer SterilizationStatus){this.SterilizationStatus=SterilizationStatus;}

    public Integer getAreaID(){return AreaID;}
    public void setAreaID(Integer AreaID){this.AreaID=AreaID;}

    public String tostring() {
        StringBuffer str=new StringBuffer();
        str.append("[CatID=").append(this.getCatID()).append(",CatName=").append(this.getCatName())
        .append(",Sex=").append(this.getSex()).append(",Characteristic=").append(this.getCharacteristic())
        .append("LivingStatus=").append(this.getLivingStatus()).append(",SterilizationStatus=").append(getSterilizationStatus())
        .append(",AreaID=").append(this.getAreaID()).append("]");
        return str.toString();
    }
}
