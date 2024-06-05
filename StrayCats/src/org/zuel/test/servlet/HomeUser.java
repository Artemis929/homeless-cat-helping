package org.zuel.test.servlet;

import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.FeedDao;
import org.zuel.test.dao.SterilizationApplicationDao;
import org.zuel.test.model.Feed;
import org.zuel.test.model.SterilizationApplication;
import org.zuel.test.model.Volunteer;
import org.zuel.test.service.FeedService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/homeUser")//发布路径
public class HomeUser extends HttpServlet {
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Feed> feeds=FeedDao.select(null,null,null,null,null);
        //System.out.println(feeds.get(0).getDate());
        List<SterilizationApplication>sterilizationApplications= SterilizationApplicationDao.select(null,null,null,null);
        Object type=request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        System.out.println(78966);
        if(ExamConstant.LOGIN_TYPE_VOLUNTEER.equals(type)){
            Volunteer volunteer=(Volunteer) request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_USER);
            Integer volunteerid=volunteer.getVolunteerID();//登陆后将用户id展示在页面
            //展示最新投喂记录(看是全部展示，还是部分展示)

            //展示最新绝育申请
            //仅仅查看未被绝育的猫猫
            request.setAttribute("feeds",feeds);
            request.setAttribute("sterilizationApplications",sterilizationApplications);
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_HomeUser).forward(request,response);
        }
        else{
            request.setAttribute("error1","请先进行登录");
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_LOGIN).forward(request,response);
        }

    }
    @Override
    protected void doGet(HttpServletRequest request,HttpServletResponse response)
            throws IOException,ServletException{
        process(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
