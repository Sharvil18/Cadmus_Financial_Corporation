package com.bank.interceptors;

import com.bank.models.Admin;
import com.bank.models.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class AppInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("In pre handle interceptor method");
        //Check request URI
        if(request.getRequestURI().startsWith("/app")) {
            //Get Session
            HttpSession session = request.getSession();

            //Get token stored in session
            String token = (String) session.getAttribute("token");
            System.out.println(token);

            //Get user object stored in the session
            User user = (User) session.getAttribute("user");

            Admin admin = (Admin) session.getAttribute("admin");

            //Allow if admin
            if(admin != null)
                return true;

            //Validate session attributes
            if(token == null || user == null) {
                response.sendRedirect("/");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("In post handle interceptor method");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("In after completion interceptor method");
    }
}
