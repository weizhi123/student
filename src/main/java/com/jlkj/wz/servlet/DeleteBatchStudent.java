package com.jlkj.wz.servlet;

import com.jlkj.wz.dao.StudentDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * @Auther:
 * @Date: 2019/3/10 16:42
 * @Description:
 */
public class DeleteBatchStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<String> idList = Arrays.asList(req.getParameter("ids"));
        StudentDao dao = new StudentDao();
        try {
            dao.deleteBatchStudent(idList);
            req.setAttribute("batchDelSucess","批量删除成功！");
        } catch (Exception e) {
            req.setAttribute("batchDelFail","批量删除失败！");
            e.printStackTrace();
        }
        req.getRequestDispatcher("ShowServlet").forward(req, resp);
    }
}