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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import encrypData.Encryp;

/**
 *
 * @author cuongnm
 */
public class AccountDAO {

    public Account logIn(String email, String password) {
        String encrypPass = new Encryp().hashPass(password);
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * \n"
                    + "FROM dbo.Account\n"
                    + "WHERE Email = ? AND Password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, encrypPass);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account(rs.getString(2), password);
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getIdByEmail(String email){
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * \n"
                    + "FROM dbo.Account\n"
                    + "WHERE Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public boolean checkExits(String email) {
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "SELECT * \n"
                    + "FROM dbo.Account\n"
                    + "WHERE Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void signUp(String email, String password) {
        String encrypPass = new Encryp().hashPass(password);
        try {
            Connection conn = new DBContext().getConnection();
            String sql = "INSERT INTO dbo.Account\n"
                    + "(Email, Password)\n"
                    + "VALUES(?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, encrypPass);
            ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
