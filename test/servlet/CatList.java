package org.zuel.test.servlet;

import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.AreaDao;
import org.zuel.test.dao.CatDao;
import org.zuel.test.model.Area;
import org.zuel.test.model.Cat;
import org.zuel.test.model.Volunteer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CatList extends HttpServlet {
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Object type=request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        String areaid = (request.getParameter("areaid"));
        String sex = request.getParameter("sex");
        String livingstatus = request.getParameter("livingstatus");
        if(ExamConstant.LOGIN_TYPE_VOLUNTEER.equals(type)) {
            Volunteer volunteer=(Volunteer) request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_USER);
            Integer volunteerid=volunteer.getVolunteerID();//登陆后将用户id展示在页面
            if (areaid.isEmpty()) {
                areaid = null;
            }
            if (sex.isEmpty()) {
                sex = null;
            }
            if (livingstatus.isEmpty()) {
                livingstatus = null;
            }
            Integer areaID = Integer.valueOf(areaid);
            List<Cat> cats = CatDao.select(null, null, sex, null, livingstatus, null, areaID);
            //在jsp文件中的引用、引用是只要引用对应的areaid（挑选！输入）来进行筛选时区域的选择
            List<Area> areas= AreaDao.select(null,null,null,null);
            request.setAttribute("areas",areas);
            request.setAttribute("cats",cats);
            //四种归属状态在jsp中做成一个下拉框
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_CatList).forward(request,response);

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


