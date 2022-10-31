package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.config.MyBatisConfig;

import vo.UserVO;

public class UserDAO {
   public static final int DELETED_USER_CODE = -1; //탈퇴한 아이디
   public static final int RESTORED_USER_CODE = 0; //회복한 계정
   public static final int DUPLICATED_ID_CODE = 1; // 중복 아이디
   public static final int ENABLED_ID_CODE = 2; //이용 가능한 아이디
   
   public SqlSession sqlSession;

   public UserDAO() {
	      sqlSession = MyBatisConfig.getSqlsessionFactory().openSession(true);
   }
   
   UserVO userVO = new UserVO();
   Map<String, Object> map = new HashMap<String, Object>();
   
   int userNumber = userVO.getUserNumber();
   String userId = userVO.getUserId();
   String userPassword = userVO.getUserPassword();
   String userName = userVO.getUserName();
   int userAge = userVO.getUserAge();
   String userPhoneNumber = userVO.getUserPhoneNumber();
   int userStatus = userVO.getUserStatus();
   String userBirth = userVO.getUserBirth();
   
   
//   map.put("userNumber", userNumber);
//   map.put("userId", userId);
//   map.put("userPassword", userPassword);
//   map.put("userName", userName);
//   map.put("userAge", userAge);
//   map.put("userPhoneNumber", userPhoneNumber);
//   map.put("userStatus", userStatus);
//   map.put("userBirth", userBirth);
   
   
//   아이디 중복검사   
   public boolean checkId(String userId) {
	   return (Integer)sqlSession.selectOne("User.checkId", userId) ==1;
   }
   
//   회원가입
   public void insert(UserVO userVO) {
	   sqlSession.insert("User.insertId", userVO);
   }
   
//   로그인
   
   
//   아이디 찾기
   public List<UserVO> findId(String userPhoneNumber){
	   return sqlSession.selectList("User.findId", userPhoneNumber);
   }
   
//   회원 정보 전체 조회
   public UserVO selectUser(int userNumber) {
	   return sqlSession.selectOne("User.informationCheck", userNumber);
   }
   
//   회원 탈퇴
   public void delete(int userNumber) {
	   sqlSession.update("User.delete", userNumber);
   }
   
   
//   회원 탈퇴 복구
   public void restore(int userNumber) {
	   sqlSession.update("User.restore", userNumber);
   }
   
//   같은 핸드폰 번호로 가입된 아이디 개수 조회
   public List<UserVO> findUsersByUserPhoneNumber(String userPhoneNumber) {
	   return sqlSession.selectList("User.checkPhoneNumber", userPhoneNumber);
   }
   
}
