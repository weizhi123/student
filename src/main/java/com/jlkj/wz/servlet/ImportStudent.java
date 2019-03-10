package com.jlkj.wz.servlet;

import com.jlkj.wz.dao.StudentDao;
import com.jlkj.wz.entity.Student;
import com.jlkj.wz.util.ImportExcel;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

/**
 * @Auther:
 * @Date: 2019/3/10 19:26
 * @Description:
 */

public class ImportStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
   // protected void doPost(@RequestParam("file") MultipartFile file,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
             MultipartFile file =null;
            ImportExcel ei = new ImportExcel(file, 1, 0);
            List<Student> list = ei.getDataList(Student.class);
            if(list != null){
                for (Student item : list) {
                    if (StringUtils.isAnyEmpty(item.getStudentId(), item.getUserName(),
                            item.getGender(), item.getEmail())){
                        req.setAttribute("fail","导入失败，缺少必要的参数！");
                    }else{
                        try {
                            String studentId = new BigDecimal(item.getStudentId()+"").toPlainString();
                            item.setStudentId(studentId);
                            StudentDao dao = new StudentDao();
                            dao.addStudent(item);
                            req.setAttribute("suc","导入成功!");
                        } catch (Exception e) {
                            req.setAttribute("fail","错误！" + e.getClass().getName());
                            e.printStackTrace();
                        }
                    }
                }
            }else{
                req.setAttribute("fail","错误！");
            }

        } catch (Exception e) {
            //req.setAttribute("fail","错误！" + e.getClass().getName());
            req.setAttribute("fail","导入失败，缺少必要的参数！");
            e.printStackTrace();
        }
        req.getRequestDispatcher("ShowServlet").forward(req, resp);
    }
}
