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

        // Set SameSite=None attribute if supported
        if (isSameSiteNoneCompatible()) {
            cookie.setSecure(true); // Ensure cookie is only sent over HTTPS
            cookie.setHttpOnly(true);
            response.setHeader("Set-Cookie", String.format("%s=%s; Max-Age=%d; Path=/; Secure; HttpOnly; SameSite=None", name, value, hours * 60 * 60));
        } else {
            response.addCookie(cookie); // Fallback for older browsers
        }
    }

    // Check if SameSite=None is supported
    private boolean isSameSiteNoneCompatible() {
        String userAgent = request.getHeader("User-Agent");
        // Add more user agents as needed
        return !userAgent.contains("MSIE") && !userAgent.contains("Trident");
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
