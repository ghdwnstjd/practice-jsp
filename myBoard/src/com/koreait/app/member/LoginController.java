package com.koreait.app.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.app.Execute;
import com.koreait.app.Result;

public class LoginController implements Execute{
   @Override
   public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      Result result = new Result();
      String memberId = null, memberPw = null;
      
      
      if(req.getHeader("Cookie") != null) {
         for(Cookie cookie : req.getCookies()) {
            if(cookie.getName().equals("memberId")) {
               memberId = cookie.getValue();
            }
            if(cookie.getName().equals("memberPw")) {
               memberPw = cookie.getValue();
            }
         }
      }
      
      req.setAttribute("memberId", memberId);
      if(memberPw != null) {
         result.setPath("/member/loginOk.me?autoLogin=true");
         
      }else {
         result.setPath("/app/member/login.jsp");
      }
      
      return result;
   }
}

   
   
   
   