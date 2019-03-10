package com.jlkj.wz.servlet;

import com.jlkj.wz.dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Auther:
 * @Date: 2019/3/10 14:44
 * @Description:
 */
public class DeleteServlet extends HttpServlet { // 删除数据

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("studentId"); // 删除数据的ID，根据ID删除
        if (studentId != null && !studentId.equals("")) {
            StudentDao dao = new StudentDao();
            try {
                dao.deleteStudent(studentId);
                req.setAttribute("delSucess","删除成功！");
            } catch (Exception e) {
                req.setAttribute("delFail","删除失败！");
                e.printStackTrace();
            }
        }else {
            req.setAttribute("delFail","删除失败！");
        }
        req.getRequestDispatcher("ShowServlet").forward(req, resp);
    }

}
