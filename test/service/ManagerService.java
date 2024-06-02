package org.zuel.test.service;

import org.zuel.test.dao.ManagerDao;
import org.zuel.test.dao.VolunteerDao;
import org.zuel.test.model.Manager;
import org.zuel.test.model.Volunteer;

import java.util.List;

public class ManagerService {
    public static Manager login(Integer ManagerID, String ManagerSecret){//用户登录
        Manager model=null;
        List<Manager> models= ManagerDao.select(ManagerID,ManagerSecret,null,null);
        if(models.size()>0){
            model=models.get(0);
            System.out.println("用户["+model.getManagerName()+"[登陆成功");
        }else
            System.out.println("用户id或密码错误，登陆失败");
        return model;
    }
}
