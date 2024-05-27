package org.zuel.test.model;

public class Manager {
    private Integer ManagerID;
    private String ManagerName;
    private String ManagerSecret;
    private String TelephoneNumber;

    public Manager(){}

    public Manager(Integer ManagerID,String ManagerName,String ManagerSecret,String TelephoneNumber)
    {
        this.ManagerID=ManagerID;
        this.ManagerName=ManagerName;
        this.ManagerSecret=ManagerSecret;
        this.TelephoneNumber=TelephoneNumber;
    }

    public Integer getManagerID(){return ManagerID;}
    public void setManagerID(Integer ManagerID){this.ManagerID=ManagerID;}

    public String getManagerName(){return ManagerName;}
    public void setManagerName(String ManagerID){this.ManagerName=ManagerName;}


    public String getManagerSecret(){return ManagerSecret;}
    public void setManagerSecret(String ManagerSecret){this.ManagerSecret=ManagerSecret;}

    public String getTelephoneNumber(){return TelephoneNumber;}
    public void setTelephoneNumber(String TelephoneNumber){this.TelephoneNumber=TelephoneNumber;}

    public String tostring() {
        StringBuffer str=new StringBuffer();
        str.append("[ManagerID=").append(this.getManagerID())
                .append(",ManagerName=").append(this.getManagerName())
                .append(",ManagerSecret=").append(this.getManagerSecret())
                .append(",TelephoneNumber=").append(this.getTelephoneNumber())
                .append("]");
        return str.toString();
    }
}
