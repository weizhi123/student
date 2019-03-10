package com.jlkj.wz.servlet;

/**
 * @Auther:
 * @Date: 2019/3/10 14:38
 * @Description:
 */



import com.jlkj.wz.dao.StudentDao;
import com.jlkj.wz.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddServlet extends HttpServlet { // 添加数据
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("userName");
        String studentId = req.getParameter("studentId");
        String age= req.getParameter("age");
        String gender= req.getParameter("gender");
        String email= req.getParameter("email");
        Student student = new Student();
        student.setAge(Integer.parseInt(age));
        student.setStudentId(studentId);
        student.setGender(gender);
        student.setEmail(email);
        //student.setUserName(username);
        student.setUserName(new String(username.getBytes("ISO-8859-1"),"UTF-8"));// 转值，中文需要转换为utf-8
        StudentDao dao = new StudentDao();
        if(dao.selectStudentById(studentId) != null){
            req.setAttribute("alreadyExists","该学号已存在！");
        }else{
            dao.addStudent(student);
        }

        req.getRequestDispatcher("ShowServlet").forward(req, resp);
    }
}
