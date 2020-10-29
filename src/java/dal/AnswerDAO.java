/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Answer;

/**
 *
 * @author cuongnm
 */
public class AnswerDAO {

    public void addAnswer(Answer answer) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO dbo.Answer\n"
                    + "(SurveyId,Answer,GuestId,QuestionId)\n"
                    + "VALUES (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, answer.getsId());
            ps.setString(2, answer.getAnswer());
            ps.setInt(3, answer.getgId());
            ps.setInt(4, answer.getQuestionId());
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Answer> getAnswerByGuest(String gId) {
        ArrayList<Answer> answerList = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT *\n"
                    + "FROM dbo.Answer\n"
                    + "WHERE GuestId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, gId);
            ResultSet rs =  ps.executeQuery();
            
            while (rs.next()) {                
                answerList.add(new Answer(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }
            
            ps.close();
            conn.close();

            return answerList;
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        ArrayList<Answer> list = new ArrayList<>();
        //list.add(new Answer(1, 1, cuong, 2, 3));
    }
}
