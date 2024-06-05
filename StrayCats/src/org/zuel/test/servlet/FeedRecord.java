package org.zuel.test.servlet;


import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.FeedDao;
import org.zuel.test.model.Feed;
import org.zuel.test.model.Volunteer;
import org.zuel.test.service.FeedService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/FeedRecord")
public class FeedRecord extends HttpServlet {
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Object type=request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        if(ExamConstant.LOGIN_TYPE_VOLUNTEER.equals(type)){
            Volunteer volunteer=(Volunteer) request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_USER);
            Integer volunteerid=volunteer.getVolunteerID();//登陆后将用户id展示在页面
            //投喂排行榜
            //在前端用数组输出
            List<Integer[]> feedamounts= FeedService.feedamount();
            request.setAttribute("feedamounts",feedamounts);
            //我的投喂记录
            List<Feed> feeds= FeedDao.select(volunteerid,null,null,null,null);
            request.setAttribute("feeds",feeds);
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_FeedRecord).forward(request,response);
        }
        else{
            request.setAttribute("error","请先进行登录");
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