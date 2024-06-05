package org.zuel.test;

import org.zuel.test.dao.CatDao;
import org.zuel.test.model.Cat;
import org.zuel.test.service.FeedService;
import org.zuel.test.util.Dbutil;

import java.util.Arrays;
import java.util.List;

public class Test {
    public static void main(String[] args) throws Exception{
        List<Integer[]> model=FeedService.feedamount();
        //System.out.println(Arrays.toString((Integer[]) model.get(0)));
       // FeedService.feedamount();

        List<Cat> cat = CatDao.select(null,null,null,null,null,null,1);
        Cat models=cat.get(0);
        System.out.println(models.getAreaID()+"\t"+models.getCatName());
    }
}
