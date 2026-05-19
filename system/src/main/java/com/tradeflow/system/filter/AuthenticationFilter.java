package com.tradeflow.system.filter;

import java.io.IOException;

import com.tradeflow.system.utils.SessionUtil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class AuthenticationFilter implements Filter{
	@Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
	
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
        String path = uri.substring(contextPath.length());
        
        if( path.startsWith("/css/") || 
        	path.startsWith("/images/") || 
        	path.startsWith("/resources/") || 
        	path.endsWith(".css") || 
        	path.endsWith(".js") || 
        	path.endsWith(".png") || 
        	path.endsWith(".jpg") || path.endsWith(".jpeg")) {
        	chain.doFilter(request, response);
        	return;
        }
        
        boolean publicPage = path.equals("/login") || path.equals("/home") || path.equals("/aboutUs") || path.equals("/contactUs") || path.equals("/register");
        
        String email = (String) SessionUtil.getAttribute(req, "email");
        String role = (String) SessionUtil.getAttribute(req, "role");
        
        boolean isLoggedIn = (email != null);
        
        if(!isLoggedIn) {
        	if(publicPage) {
        		chain.doFilter(request, response);
        	}
        	else {
        		res.sendRedirect(contextPath + "/login");
        	}
        	return;
        }
        
    
    	if(path.equals("/login")) {
    		if("admin".equalsIgnoreCase(role)) {
    			res.sendRedirect(contextPath + "/admin/dashboard");
    		}
    		else if ("salesperson".equalsIgnoreCase(role)) {
    			res.sendRedirect(contextPath + "/salesperson/dashboard");
    		}
    		return;
    	}
    	
    	if(path.startsWith("/admin") && !"admin".equalsIgnoreCase(role)) {
    		res.sendRedirect(contextPath + "/login");
    		return;
    	}
    	
    	if(path.startsWith("/salesperson") && !"salesperson".equalsIgnoreCase(role)) {
    		res.sendRedirect(contextPath + "/login");
    		return;
    	}
        
    	chain.doFilter(request, response);
	}
}
