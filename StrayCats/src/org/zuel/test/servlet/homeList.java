package org.zuel.test.servlet;

import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.AreaDao;
import org.zuel.test.dao.HomeDao;
import org.zuel.test.model.Area;
import org.zuel.test.model.Home;
import org.zuel.test.model.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/HomeList")
public class homeList extends HttpServlet {
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Object type = request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        String areaid = (request.getParameter("areaid"));
        if (ExamConstant.LOGIN_TYPE_VOLUNTEER.equals(type)) {
            Volunteer volunteer=(Volunteer) request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_USER);
            Integer volunteerid=volunteer.getVolunteerID();//登陆后将用户id展示在页面
            if(areaid.isEmpty()){areaid=null;}
            Integer areaID = Integer.valueOf(areaid);
            //在前端页面中显示所选地区的猫屋详细信息
            List<Home> homes = HomeDao.select(null, null, areaID);
            request.setAttribute("homes", homes);
            //在前端页面显示可选的areaid,做成下拉框
            List<Area> areas = AreaDao.select(null, null, null, null);
            request.setAttribute("areas",areas);
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_HomeList).forward(request, response);
        } else {
            request.setAttribute("error", "请先进行登录");
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_LOGIN).forward(request, response);
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
