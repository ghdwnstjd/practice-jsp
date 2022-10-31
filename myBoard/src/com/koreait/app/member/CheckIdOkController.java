package com.koreait.app.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.koreait.app.Execute;
import com.koreait.app.Result;
import com.koreait.app.member.dao.MemberDAO;

public class CheckIdOkController implements Execute{
   @Override
   public Result execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	   화면에서 작성한 ID 텍스트를 memberId로 저장
      String memberId = req.getParameter("memberId");
//      out.print를 사용하기 위한 객체
      PrintWriter out = resp.getWriter();
//      JSON 파싱을 위해 선언
      JSONObject jsonObject = new JSONObject();
      
//		Json 형태로 key 값 result, value 값으로 checkId 메소드 결과를 받는다.
      jsonObject.put("result", new MemberDAO().checkId(memberId));
      out.print(jsonObject.toJSONString());
     
      out.close();
      return null;
   }
}