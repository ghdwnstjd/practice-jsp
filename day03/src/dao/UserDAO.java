package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.config.MyBatisConfig;

import vo.UserVO;

public class UserDAO {
   public Connection connection;
   public PreparedStatement preparedStatement;
   public ResultSet resultSet;
   public SqlSession sqlSession;
   
   public UserDAO() {
      sqlSession = MyBatisConfig.getSqlsessionFactory().openSession(true);
   }
   
   public boolean checkId(String userId) {
      return (Integer)sqlSession.selectOne("User.checkId", userId) == 1;
   }
   
   
//   회원가입
   public void insert(UserVO userVO) {
	   sqlSession.insert("User.insertId", userVO);
   }

   
   
//   전체 회원 조회
   public List<UserVO> selectAll(){
	   sqlSession.selectList("User.selectAll").forEach(System.out::println);
	   return null;
   }
}
