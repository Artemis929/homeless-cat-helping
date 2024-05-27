package org.zuel.test.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Feed {
    private Integer VolunteerID;
    private Integer HomeID;
    private Integer Amount;
    private BigDecimal Price;
    private Timestamp Date;

    public Feed(){}

    public Feed(Integer VolunteerID,Integer HomeID,Integer Amount,BigDecimal Price,Timestamp Date)
    {
        this.VolunteerID=VolunteerID;
        this.HomeID=HomeID;
        this.Amount=Amount;
        this.Price=Price;
        this.Date=Date;
    }
    public Integer getVolunteerID(){return VolunteerID;}
    public void setVolunteerID(Integer VolunteerID){this.VolunteerID=VolunteerID;}

    public Integer getHomeID(){return HomeID;}
    public void setHomeID(Integer HomeID){this.HomeID=HomeID;}

    public Integer getAmount(){return Amount;}
    public void setAmount(Integer Amount){this.Amount=Amount;}

    public BigDecimal getPrice() { return Price;}
    public void setPrice(BigDecimal Price) { this.Price = Price; }

    public Timestamp getDate() { return Date; }
    public void setDate(Timestamp Date) { this.Date = Date; }

    public String tostring()
    {
        StringBuffer str=new StringBuffer();
        str.append("[VolunteerID=").append(this.getVolunteerID())
                .append(",HomeID=").append(this.getHomeID())
                .append(",Amount=").append(this.getAmount())
                .append(",Price=").append(this.getPrice())
                .append(",Date=").append(this.getDate())
                .append("]");
        return str.toString();
    }
}
