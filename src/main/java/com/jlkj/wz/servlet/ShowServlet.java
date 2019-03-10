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
 * @Date: 2019/3/10 14:50
 * @Description:
 */
public class ShowServlet extends HttpServlet { // 显示全部数据

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentDao dao = new StudentDao();
        List<Student> list = dao.getAllStudent();
        req.setAttribute("list", list);
        req.getRequestDispatcher("show.jsp").forward(req, resp);
    }
}
