package org.zuel.test.servlet;

import org.zuel.test.constant.ExamConstant;
import org.zuel.test.dao.AreaDao;
import org.zuel.test.model.Area;
import org.zuel.test.model.Manager;
import org.zuel.test.model.Volunteer;
import org.zuel.test.service.ManagerService;
import org.zuel.test.service.VolunteerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/login")//发布路径
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String type=request.getParameter("type");
        String userid=request.getParameter("userID");
        String password=request.getParameter("password");
        boolean loginFlag=false;//判断登陆是否成功的标识
        //判断参数，开始时设为false
        if(type!=null&&userid!=null&&password!=null&&type.trim().length()>0
               &&password.trim().length()>0&&userid.trim().length()>0)
        //trim()方法用来删除字符串头尾的空白符
            //[0是用户，1是负责人]登陆成功则修改登陆标识与跳转页面地址，同时传递对应页面默认展示的数据
                       //要求用户输入或选择的内容都不为空

        {
            Integer userID=Integer.valueOf(userid);
            if(ExamConstant.LOGIN_TYPE_VOLUNTEER.equals(type))//如果是用户类型
            {
                Volunteer volunteer= VolunteerService.login(userID,password);//根据用户输入的内容获得对应用户的全部信息
                if(volunteer!=null)
                {
                    loginFlag=true;
                    System.out.println("登陆成功");
                    request.getSession().setAttribute(ExamConstant.SESSION_LOGIN_USER,volunteer);
                }
                if(loginFlag)//根据判断标识判读是否登陆成功true则登陆成功，否则，反之
                {
                    request.getSession().setAttribute(ExamConstant.SESSION_LOGIN_TYPE,type);
                    response.sendRedirect(ExamConstant.HOME_PAGE_HomeUser);//跳转到用户的相关界面
                }
                else {
                    request.setAttribute("error","用户名或密码错误，请重新填写");
                    request.getRequestDispatcher(ExamConstant.HOME_PAGE_LOGIN).forward(request,response);
                    //携带数据进行页面传递，因此登陆失败可以看到"用户名或密码错误，请重新填写"这段文字；
                }
            }
            else if(ExamConstant.LOGIN_TYPE_MANAGER.equals(type)){
                Manager manager= ManagerService.login(userID,password);
                if(manager!=null)
                {
                    loginFlag=true;
                    //得到管理人员对应的管理区域
                    Area area=AreaDao.select(null,null,null,userID).get(0);
                    request.getSession().setAttribute(ExamConstant.SESSION_MANAGER_AREA,area);
                    //将manager对象写入session中，用于保持用户的登陆状态，参数，属性名称，属性值
                    request.getSession().setAttribute(ExamConstant.SESSION_LOGIN_USER,manager);
                }
                if(loginFlag)
                {
                    request.getSession().setAttribute(ExamConstant.SESSION_LOGIN_TYPE,type);
                    response.sendRedirect(ExamConstant.HOME_PAGE_HomeManager);//跳转到负责人的相关界面
                }
                else{
                    request.setAttribute("error","用户名或密码错误，请重新填写");
                    request.getRequestDispatcher(ExamConstant.HOME_PAGE_LOGIN).forward(request,response);
                }

            }
        }
        else{
            if(userid==null&&userid.trim().length()==0){
                request.setAttribute("error1", "用户名为空");
            }
            if(password==null&&password.trim().length()==0){
                request.setAttribute("error2", "密码为空");
            }
            //存在为空的信息，仍处于登陆页面
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_LOGIN).forward(request, response);
        }
    }

}
