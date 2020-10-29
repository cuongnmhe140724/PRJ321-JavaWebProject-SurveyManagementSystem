/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.user;

import dal.AnswerDAO;
import dal.GuestDAO;
import dal.QuestionDAO;
import dal.SurveyDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Answer;
import model.Question;
import model.Survey;

/**
 *
 * @author cuongnm
 */
public class doSurvey extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequestGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int number = new Random().nextInt(3);
        System.out.println(number);
        String img = "surveyHeader" + number + ".png";
        String name = request.getParameter("name");
        String id = request.getParameter("surveyId");
        SurveyDAO surveyDao = new SurveyDAO();
        QuestionDAO questionDao = new QuestionDAO();

        Survey s = surveyDao.getSurveyById(id);
        ArrayList<Question> questionList = questionDao.getQuestionById(id);

        if (s.getStatus().equals("Running")) {
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("img", img);
            request.setAttribute("survey", s);
            request.setAttribute("questionList", questionList);
            request.getRequestDispatcher("doSurvey.jsp").forward(request, response);
            return;
        }

        request.setAttribute("err", "Invalid survey ID!");
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

    protected void processRequestPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        int sId = Integer.parseInt(request.getParameter("id"));

        QuestionDAO questionDao = new QuestionDAO();
        GuestDAO guestDao = new GuestDAO();
        AnswerDAO answerDao = new AnswerDAO();
        
        guestDao.addGuest(name);
        int gId = guestDao.getGuestByName(name).getId();

        ArrayList<Question> questionList = questionDao.getQuestionById(sId + "");
        ArrayList<Answer> answerList = new ArrayList<>();

        for (int i = 0; i < questionList.size(); i++) {
            String qId = questionList.get(i).getId();
            String content = request.getParameter(qId);
            Answer answer = new Answer(i, sId, content, gId,
                    Integer.parseInt(qId));
            answerList.add(answer);
        }

        for (Answer answer : answerList) {
            answerDao.addAnswer(answer);
        }
        
        request.setAttribute("answerList", answerList);
        request.getRequestDispatcher("doSurvey.jsp").forward(request, response);
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestGet(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequestPost(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
