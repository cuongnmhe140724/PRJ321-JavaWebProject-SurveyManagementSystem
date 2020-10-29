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
import model.Question;
import model.Survey;

/**
 *
 * @author cuongnm
 */
public class QuestionDAO {

    public ArrayList<Question> getQuestionById(String id) {
        ArrayList<Question> questionList = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * \n"
                    + "FROM dbo.Question\n"
                    + "WHERE SurveyId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                questionList.add(new Question(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4)));
            }
            return questionList;
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Question getQuestionByQuestionId(String qId) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT *\n"
                    + "FROM dbo.Question \n"
                    + "WHERE Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, qId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Question q = new Question(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getBoolean(4));
                return q;
            }
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addQuestion(String sId, String question, String required) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO dbo.Question\n"
                    + "(SurveyId,Question,Required)\n"
                    + "VALUES(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sId);
            ps.setString(2, question);
            ps.setString(3, required);

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteQuestion(String id) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "DELETE FROM dbo.Question\n"
                    + "WHERE Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateQuestion(String id, String question, String required) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "UPDATE dbo.Question\n"
                    + "SET Question = ? , Required = ?\n"
                    + "WHERE Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, question);
            ps.setString(2, required);
            ps.setString(3, id);

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
