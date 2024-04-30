package hcmute.service.impl;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CookieServiceImpl {
    @Autowired
    HttpServletRequest request;
    @Autowired
    HttpServletResponse response;

    public String getValue(String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(name)) {
                    return cookie.getValue();
                }
            }
        }
        return "";
    }

    public void add(String name, String value, int hours) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(hours * 60 * 60);
        cookie.setPath("/");
        
        // Construct the Set-Cookie header with the SameSite attribute
        String cookieString = String.format("%s=%s; Max-Age=%d; Path=/; Secure; HttpOnly; SameSite=None", name, value, hours * 60 * 60);
        response.setHeader("Set-Cookie", cookieString);
    }


    public Cookie remove(String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(name)) {
                    cookie.setMaxAge(0);
                    return cookie;
                }
            }
        }
        return null;
    }
}
