package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestDAO {
   public Connection connection;
   public PreparedStatement preparedStatement;
   public ResultSet resultSet;
   
//   전체 회원 조회
   public ArrayList<GuestVO> selectAll(){
      String query = "select guest_number, guest_name, guest_birth from tbl_guest";
      ArrayList<GuestVO> guests = new ArrayList<>();

      try {
         connection = DBConnecter.getConnection();
         preparedStatement = connection.prepareStatement(query);
         resultSet = preparedStatement.executeQuery();
         
         while(resultSet.next()) {
            GuestVO guestVO = new GuestVO();
            guestVO.setGuestNumber(resultSet.getInt(1));
            guestVO.setGuestName(resultSet.getString(2));
            guestVO.setGuestBirth(resultSet.getString(3));
            
            guests.add(guestVO);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(resultSet != null) {
               resultSet.close();
            }
            if(preparedStatement != null) {
               preparedStatement.close();
            }
            if(connection != null) {
               connection.close();
            }
         } catch (SQLException e) {
            throw new RuntimeException(e);
         }
      }
      return guests;
   }
   
//   특정 회원 조회
   public ArrayList<GuestVO> select(String keyword){
      String query = "select guest_number, guest_name, guest_birth from tbl_guest where guest_name = ?";
      ArrayList<GuestVO> guests = new ArrayList<>();
      
      try {
         connection = DBConnecter.getConnection();
         preparedStatement = connection.prepareStatement(query);
         preparedStatement.setString(1, keyword);
         resultSet = preparedStatement.executeQuery();
         
         while(resultSet.next()) {
            GuestVO guestVO = new GuestVO();
            guestVO.setGuestNumber(resultSet.getInt(1));
            guestVO.setGuestName(resultSet.getString(2));
            guestVO.setGuestBirth(resultSet.getString(3));
            
            guests.add(guestVO);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         try {
            if(resultSet != null) {
               resultSet.close();
            }
            if(preparedStatement != null) {
               preparedStatement.close();
            }
            if(connection != null) {
               connection.close();
            }
         } catch (SQLException e) {
            throw new RuntimeException(e);
         }
      }
      return guests;
   }
   
   
//   오름차순, 내림차순으로 정렬하기
   public ArrayList<GuestVO> orderBy(int guestNumber){
      String query = "select guest_number, guest_name, guest_birth from tbl_guest where guest_number=?";
      ArrayList<GuestVO> guests = new ArrayList<>();
      GuestDAO guestDAO = new GuestDAO();
      
      guests = guestDAO.selectAll();
      
      try {
          connection = DBConnecter.getConnection();
          preparedStatement = connection.prepareStatement(query);
          preparedStatement.setInt(1, guestNumber);
          resultSet = preparedStatement.executeQuery();
          
          while(resultSet.next()) {
             GuestVO guestVO = new GuestVO();
             guestVO.setGuestNumber(resultSet.getInt(1));
             guestVO.setGuestName(resultSet.getString(2));
             guestVO.setGuestBirth(resultSet.getString(3));
             
             guests.add(guestVO);
          }
          
       } catch (SQLException e) {
          e.printStackTrace();
       } catch (Exception e) {
          e.printStackTrace();
       } finally {
          try {
             if(resultSet != null) {
                resultSet.close();
             }
             if(preparedStatement != null) {
                preparedStatement.close();
             }
             if(connection != null) {
                connection.close();
             }
          } catch (SQLException e) {
             throw new RuntimeException(e);
          }
       }
       return guests;
    }
   
}





















