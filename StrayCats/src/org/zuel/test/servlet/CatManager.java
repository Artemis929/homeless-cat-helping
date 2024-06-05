package org.zuel.test.servlet;

import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.AreaDao;
import org.zuel.test.dao.CatDao;
import org.zuel.test.model.Area;
import org.zuel.test.model.Cat;
import org.zuel.test.model.Manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/CatManager")
public class CatManager extends HttpServlet {
    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Object type = request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        String areaid = (request.getParameter("areaid"));
        String sex = request.getParameter("sex");
        String livingstatus = request.getParameter("livingstatus");
        if(ExamConstant.LOGIN_TYPE_MANAGER.equals(type)){
            Manager manager=(Manager) request.getSession().getAttribute(ExamConstant.SESSION_LOGIN_USER);
            Integer managerid=manager.getManagerID();
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
            //manager用户管辖区域的id,在后端展示
            List<Area> areas= AreaDao.select(null,null,null,managerid);
            request.setAttribute("areas",areas);
            List<Cat> cats= CatDao.select(null,null,sex,null,livingstatus,null,areaID);
            request.setAttribute("cats",cats);
            //四种归属状态和性别在jsp中做成一个下拉框(像type的选择)
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_CatManager).forward(request,response);
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
