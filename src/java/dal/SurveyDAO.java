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
import model.Account;
import model.Survey;

/**
 *
 * @author cuongnm
 */
public class SurveyDAO {

    public ArrayList<Survey> getSurveyByAccount(String email) {
        ArrayList<Survey> surveyList = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT s.*\n"
                    + "FROM dbo.Survey s\n"
                    + "JOIN dbo.Account a ON s.AccId = a.Id\n"
                    + "WHERE a.Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                surveyList.add(new Survey(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return surveyList;
    }
    
    public Survey getSurveyById(String id) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * \n"
                    + "FROM dbo.Survey s\n"
                    + "WHERE s.Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Survey s = new Survey(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Survey getSurveyByIdEmail(String id, String email) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT s.* \n"
                    + "FROM dbo.Survey s\n"
                    + "JOIN dbo.Account a ON a.Id = s.AccId\n"
                    + "WHERE s.Id = ? AND Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Survey s = new Survey(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                return s;
            }
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editSurvey(String id, String title, String detail, String status) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "UPDATE dbo.Survey\n"
                    + "SET Title = ?, Detail = ?, Status = ?\n"
                    + "WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(4, id);
            ps.setString(1, title);
            ps.setString(2, detail);
            ps.setString(3, status);

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addSurvey(int accId, String title, String detail) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO dbo.Survey\n"
                    + "(AccId,Title,Detail,Status)\n"
                    + "VALUES(?,?,?,? )";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, accId + "");
            ps.setString(2, title);
            ps.setString(3, detail);
            ps.setString(4, "Pending");

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deteteSurvey(int id) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "DELETE FROM dbo.Survey \n"
                    + "WHERE Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id + "");

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
