package org.zuel.test.servlet;

import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.FeedDao;
import org.zuel.test.dao.SterilizationApplicationDao;
import org.zuel.test.model.Feed;
import org.zuel.test.model.Manager;
import org.zuel.test.model.SterilizationApplication;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/HomeManager")
public class HomeManager extends HttpServlet {
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Object type=request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        List<Feed> feeds= FeedDao.select(null,null,null,null,null);
        List<SterilizationApplication>sterilizationApplications= SterilizationApplicationDao.select(null,null,null,null);
        if(ExamConstant.LOGIN_TYPE_MANAGER.equals(type)){
            //manager登陆后显示其id//
            Manager manager=(Manager) request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_USER);
            Integer managerid=manager.getManagerID();
            //在前端展示最新记录
            request.setAttribute("feeds",feeds);
            request.setAttribute("sterilizationApplications",sterilizationApplications);
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_HomeManager).forward(request,response);

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
