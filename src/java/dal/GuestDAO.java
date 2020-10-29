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
import model.Guest;

/**
 *
 * @author cuongnm
 */
public class GuestDAO {

    public void addGuest(String name) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO dbo.Guest\n"
                    + "(NAME)VALUES(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);

            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Guest getGuestByName(String name) {
        ArrayList<Guest> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * FROM dbo.Guest \n"
                    + "  WHERE NAME = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Guest(rs.getInt(1), rs.getString(2)));
            }
            return list.get(list.size() - 1);
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Guest> getGuestBySurvey(String sId) {
        ArrayList<Guest> list = new ArrayList<>();
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT DISTINCT a.GuestId, g.NAME\n"
                    + "FROM dbo.Answer a\n"
                    + "JOIN dbo.Guest g ON g.Id = a.GuestId\n"
                    + "WHERE a.SurveyId = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, sId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Guest(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(SurveyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        System.out.println(new GuestDAO().getGuestByName("cuong"));
    }
}
