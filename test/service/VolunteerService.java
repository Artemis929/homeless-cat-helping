package org.zuel.test.service;

import org.zuel.test.dao.VolunteerDao;
import org.zuel.test.model.Volunteer;

import java.util.List;

public class VolunteerService {
    public static Volunteer login(Integer VolunteerID,String VolunteerSecret){//用户登录
        Volunteer model=null;
        List<Volunteer> models= VolunteerDao.select(VolunteerID,null,VolunteerSecret);
        if(models.size()>0){
            model=models.get(0);
            System.out.println("用户["+model.getVolunteerName()+"[登陆成功");
        }else
            System.out.println("用户id或密码错误，登陆失败");
        return model;
    }

}
