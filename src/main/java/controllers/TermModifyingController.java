package controllers;

import database.DBManager;
import entity.Discipline;
import entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "TermModifyingController", urlPatterns = "/term-modify")
public class TermModifyingController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Discipline> disciplines = DBManager.getAllActiveDisciplines();
        String termId = req.getParameter("termId");
        req.setAttribute("termId", termId);
        req.setAttribute("disciplines", disciplines);
        req.setAttribute("currentPage", "/WEB-INF/jsp/termModifying.jsp");
        req.setAttribute("titlePage", "Редактирование семестра");
        req.getRequestDispatcher("/WEB-INF/jsp/template.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String[] disciplines = req.getParameterValues("disciplines");
        String currentTermId = req.getParameter("termId");
        String week = req.getParameter("week");
        final List<Student> allActiveStudents = DBManager.getAllActiveStudents();
        final Map<String, Integer> allFromMark = DBManager.getAllIdTermDisciplineFromMark();
        int successCreateMark = 0;
        int success = DBManager.modifyTerm(currentTermId, week, disciplines);
        final List<Integer> termDisciplineIdByIdTerm = DBManager.getAllIdTermDisciplineByIdTerm(Integer.parseInt(currentTermId));
        for (int tdId : termDisciplineIdByIdTerm) {
            final boolean isIdTermDiscipline = allFromMark.get("idTermDiscipline").equals(tdId);
            for (Student stud : allActiveStudents) {
                int studId = stud.getId();
                if (!isIdTermDiscipline) {
                    successCreateMark = DBManager.createMark(studId, tdId);
                }
            }
        }

        resp.sendRedirect("terms?success=" + success + "&successCreateMark=" + successCreateMark);
    }
}
