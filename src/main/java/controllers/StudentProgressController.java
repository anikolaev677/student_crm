package controllers;

import database.DBManager;
import entity.Discipline;
import entity.Term;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@WebServlet(name = "StudentProgressController", urlPatterns = "/student-progress")
public class StudentProgressController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> data;
        String idProgressStudent = req.getParameter("idProgressStudent");
        int idStudent = Integer.parseInt(idProgressStudent);
        List<Term> terms = DBManager.getAllActiveTermAndDiscipline();
        String idTermStr = req.getParameter("idTerm");
        if (idTermStr != null) {
            int idTerm = Integer.parseInt(req.getParameter("idTerm"));
            data = DBManager.extractStudentTermsDisciplines(idStudent, idTerm);
            String[] setGrades = req.getParameterValues("setGrades");
            AtomicInteger currentMark = new AtomicInteger();

            if (setGrades != null) {
                req.setAttribute("grades", setGrades);
                data.put("marks", setGrades);
                data.entrySet().iterator().forEachRemaining(es -> {
                    if (es.getKey().equals("disciplines")) {
                        List disciplines = (ArrayList) es.getValue();
                        Iterator<Integer> grades = Arrays.stream(setGrades).map(Integer::parseInt).iterator();
                        for (Object o : disciplines) {
                            Discipline discipline = (Discipline) o;
                            currentMark.set(grades.next());
                            if (currentMark.get() != 0) {
                                discipline.setMark(currentMark.get());
                            }
                        }
                    }
                    if (es.getKey().equals("marksId")) {
                        List marksId = (ArrayList) es.getValue();
                        for (int i = 0; i < marksId.size(); i++) {
                            int grade = Integer.parseInt(setGrades[i]);
                            DBManager.updateMark((Integer) marksId.get(i), grade);
                        }
                    }
                });
                req.setAttribute("idProgressStudent", idProgressStudent);
            }
            req.setAttribute("idTerm", idTerm);
        } else {
            data = DBManager.extractStudentTermsDisciplines(idStudent, 1);
            req.setAttribute("idTerm", 1);
        }

        req.setAttribute("data", data);
        req.setAttribute("terms", terms);
        req.setAttribute("currentPage", "/WEB-INF/jsp/studentProgress.jsp");
        req.setAttribute("titlePage", "Успеваемость студента");
        req.getRequestDispatcher("/WEB-INF/jsp/template.jsp").forward(req, resp);
    }
}