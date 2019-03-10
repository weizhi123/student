package com.jlkj.wz.servlet;

import com.jlkj.wz.dao.StudentDao;
import com.jlkj.wz.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Auther:
 * @Date: 2019/3/10 16:12
 * @Description:
 */
public class FilterServlet  extends HttpServlet { // 过滤数据

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("studentId");
        StudentDao dao = new StudentDao();
        List<Student> list = dao.filterStudent(studentId);
        req.setAttribute("list", list);
        req.getRequestDispatcher("show.jsp").forward(req, resp);
    }
}
