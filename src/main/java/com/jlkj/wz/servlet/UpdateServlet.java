package com.jlkj.wz.servlet;

/**
 * @Auther:
 * @Date: 2019/3/10 14:45
 * @Description:
 */


import com.jlkj.wz.dao.StudentDao;
import com.jlkj.wz.entity.Student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class UpdateServlet extends HttpServlet{  //修改

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { // 查询到选中ID的值所对应的数据
        String idStr = req.getParameter("studentId");
        if (idStr != null && !idStr.equals("")) {
            StudentDao dao = new StudentDao();
            Student student = dao.selectStudentById(idStr);
            req.setAttribute("student", student);
        }
        req.getRequestDispatcher("update.jsp").forward(req, resp);

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {  //根据此ID对数据的值进行修改
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
       student.setUserName(new String(username.getBytes("ISO-8859-1"),"UTF-8"));
        StudentDao dao = new StudentDao();
        if (studentId != null && !studentId.equals("")) {
            try {
                dao.updateStudent(student);
                req.setAttribute("updateSucess","修改成功");
            } catch (Exception e) {
                req.setAttribute("updateFail","修改失败");
                e.printStackTrace();
            }
        }else{
            req.setAttribute("updateFail","修改失败");
        }
        Student student1=  dao.selectStudentById(studentId);
        req.setAttribute("admin",student1 );
        req.getRequestDispatcher("ShowServlet").forward(req, resp);
    }



}
