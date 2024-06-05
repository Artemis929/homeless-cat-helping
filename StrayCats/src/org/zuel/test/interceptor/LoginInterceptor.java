package org.zuel.test.interceptor;


/*import org.zuel.test.constant.ExamConstant;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "checkLogin",urlPatterns = {"/*"},
        initParams = {@WebInitParam(name="noCheck",value="/login,/homeUser,/login.jsp,/homeUser.jsp,/rep," +
                "registDoctor.jsp,/registPatient.jsp,/red,.js,.css,.jpg,.png")})
public class LoginInterceptor implements Filter {
    private String[] noCheckList;

    private boolean doCheck(String url,String rootPath)
    {
        boolean doCheckFlag=true;
        if(url.equals(rootPath+"/"))
        {
            return false;
        }
        else
        {
            for(String item:noCheckList)
            {
                if(url.endsWith(item))
                {
                    doCheckFlag=false;
                    break;
                }
            }

        }
        return doCheckFlag;
    }
    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {
        String noCheckStr= filterConfig.getInitParameter("noCheck");
        this.noCheckList=noCheckStr.split(",");
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
            throws IOException,ServletException
    {
        Object type =((HttpServletRequest)request).getSession().getAttribute(ExamConstant.SESSION_LOGIN_TYPE);
        String rootPath=((HttpServletRequest) request).getContextPath();
        String url=((HttpServletRequest) request).getServletPath();
        if(doCheck(url,rootPath)&&!ExamConstant.LOGIN_TYPE_MANAGER.equals(type)
                &&!ExamConstant.LOGIN_TYPE_VOLUNTEER.equals(type))
        {
            request.setAttribute("error","请先登录");
            request.getRequestDispatcher(ExamConstant.HOME_PAGE_LOGIN).forward(request,response);
        }
        else
        {
            filterChain.doFilter(request,response);
        }
    }
    @Override
    public void destroy() {}
}*/
