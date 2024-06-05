package org.zuel.test.model;

public class Volunteer {
    private Integer VolunteerID;
    private String VolunteerSecret;
    private String VolunteerName;

    public Volunteer(){}

    public Volunteer(Integer VolunteerID,String VolunteerSecret,String VolunteerName)
    {
        this.VolunteerID=VolunteerID;
        this.VolunteerSecret=VolunteerSecret;
        this.VolunteerName=VolunteerName;
    }

    public Integer getVolunteerID(){return VolunteerID;}
    public void setVolunteerID(Integer VolunteerID) {
        this.VolunteerID = VolunteerID;
    }

    public String getVolunteerSecret(){return VolunteerSecret;}
    public void setVolunteerSecret(String VolunteerSecret) {
        this.VolunteerSecret = VolunteerSecret;
    }

    public String getVolunteerName(){return VolunteerName;}
    public void setVolunteerName(String VolunteerName){this.VolunteerName=VolunteerName;}

    public String tostring() {
        StringBuffer str=new StringBuffer();
        str.append("[VolunteerID=").append(this.getVolunteerID())
                .append(",VolunteerSecret=").append(this.getVolunteerSecret())
                .append(",VolunteerName=").append(this.getVolunteerName())
                .append("]");
        return str.toString();
    }
}
