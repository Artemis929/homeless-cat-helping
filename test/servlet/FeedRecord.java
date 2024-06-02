package org.zuel.test.servlet;

import com.sun.org.apache.bcel.internal.generic.DCONST;
import org.zuel.test.constant.ExamConstant;
import org.zuel.test.model.Volunteer;
import org.zuel.test.service.FeedService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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

        }
    }
}