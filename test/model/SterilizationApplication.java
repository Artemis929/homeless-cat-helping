package org.zuel.test.model;

import java.math.BigDecimal;

public class SterilizationApplication {
    private Integer VolunteerID;
    private Integer CatID;
    private BigDecimal Price;
    private Integer Status;//status中0为未完成 1为已完成

    public SterilizationApplication(){}
    public SterilizationApplication(Integer VolunteerID,Integer CatID,BigDecimal Price,Integer Status)
    {
        this.VolunteerID=VolunteerID;
        this.CatID=CatID;
        this.Price=Price;
        this.Status=Status;
    }

    public Integer getVolunteerID() { return VolunteerID;}
    public void setVolunteerID(Integer VolunteerID) { this.VolunteerID = VolunteerID; }

    public Integer getCatID() { return CatID; }
    public void setCatID(Integer CatID) { this.CatID = CatID; }

    public BigDecimal getPrice() { return Price; }
    public void setPrice(BigDecimal Price) { this.Price = Price; }

    public Integer getStatus() { return Status; }
    public void setStatus(Integer Status) { this.Status = Status; }

    public String tostring()
    {
        StringBuffer str=new StringBuffer();
        str.append("[VolunteerID=").append(this.getVolunteerID()).append(",CatID=").append(this.getCatID())
                .append(",Price=").append(this.getPrice()).append(",Status=").append(this.getStatus()).append("]");
        return str.toString();
    }
}
