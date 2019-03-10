package com.jlkj.wz.servlet;

import com.google.common.collect.Lists;
import com.jlkj.wz.dao.StudentDao;
import com.jlkj.wz.entity.Student;
import com.jlkj.wz.util.ExportExcel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Auther:
 * @Date: 2019/3/10 16:33
 * @Description:
 */
public class StudentTemplateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fileName = "学生信息表.xlsx";
        List<Student> list = Lists.newArrayList();
        Student student = new Student();
        student.setId(0);
        student.setStudentId("1512011120");
        student.setUserName("wz");
        student.setAge(18);
        student.setGender("1");
        student.setEmail("411552711@qq.com");
        list.add(student);

        try {
            new ExportExcel("学生信息表", Student.class, 2).setDataList(list).write(resp, fileName).dispose();
        } catch (IOException e) {
            req.setAttribute("downTemlateFail","下载模板失败");
            e.printStackTrace();
        }
        req.getRequestDispatcher("ShowServlet").forward(req, resp);
    }
}