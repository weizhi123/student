package com.jlkj.wz.dao;

import com.jlkj.wz.entity.Student;
import com.jlkj.wz.util.DbHelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @Auther:
 * @Date: 2019/3/10 14:18
 * @Description:
 */
public class StudentDao {

    public List<Student> getAllStudent() { // 查询所有信息
        List<Student> list = new ArrayList<Student>(); // 创建集合
        Connection conn = DbHelper.getConnection();
        String sql = "select * from student"; // SQL查询语句
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                Student student = new Student();
                student.setId(rst.getInt("id")); // 得到ID
                student.setUserName(rst.getString("userName"));
                student.setStudentId(rst.getString("studentId"));
                student.setAge(rst.getInt("age"));
                student.setGender(rst.getString("gender"));
                student.setEmail(rst.getString("email"));
                list.add(student);
            }
            rst.close(); // 关闭
            pst.close(); // 关闭
        } catch (SQLException e) {
            e.printStackTrace(); // 抛出异常
        }
        return list; // 返回一个集合
    }

    public boolean addStudent(Student student) { // 添加信息
        String sql = "INSERT INTO student (studentId,userName,age,gender,email) VALUES (?,?,?,?,?)"; // 添加的SQL语句
        Connection conn = DbHelper.getConnection();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, student.getStudentId());
            pst.setString(2, student.getUserName());
            pst.setInt(3, student.getAge());
            pst.setString(4, student.getGender());
            pst.setString(5, student.getEmail());
            int count = pst.executeUpdate();
            pst.close();
            return count > 0 ? true : false; // 是否添加的判断
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateStudent(Student student) { // 修改
        String sql = "UPDATE student SET userName=?,age=?,gender=?,email=? WHERE studentId = ?"; // 修改的SQL语句，根据ID修改
        Connection conn = DbHelper.getConnection();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, student.getUserName());
            pst.setInt(2, student.getAge());
            pst.setString(3, student.getGender());
            pst.setString(4, student.getEmail());
            pst.setString(5, student.getStudentId());
            int count = pst.executeUpdate();
            pst.close(); // 关闭
            return count > 0 ? true : false; // 是否修改的判断
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public boolean deleteStudent(String studentId) { // 删除
        String sql = "delete from student where studentId= ?"; // 删除的SQL语句，根据ID删除
        Connection conn = DbHelper.getConnection();
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, studentId);
            int count = pst.executeUpdate();
            pst.close();
            return count > 0 ? true : false; // 是否删除的判断
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public Student selectStudentById(String studentId) { // 根据ID进行查询
        Connection conn = DbHelper.getConnection();
        String sql = "select * from student where studentId = " + studentId;
        Student student = null;
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                student = new Student();
                student.setId(rst.getInt("id")); // 得到ID
                student.setUserName(rst.getString("userName"));
                student.setStudentId(rst.getString("studentId"));
                student.setAge(rst.getInt("age"));
                student.setGender(rst.getString("gender"));
                student.setEmail(rst.getString("email"));
            }
            rst.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student; // 返回
    }


    public List<Student> filterStudent(String studentId) { // 查询所有信息
        List<Student> list = new ArrayList<Student>(); // 创建集合
        Connection conn = DbHelper.getConnection();
        String sql = "select * from student where studentId like '%" + studentId + "%'"; // SQL查询语句
        try {
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rst = pst.executeQuery();
            while (rst.next()) {
                Student student = new Student();
                student.setId(rst.getInt("id")); // 得到ID
                student.setUserName(rst.getString("userName"));
                student.setStudentId(rst.getString("studentId"));
                student.setAge(rst.getInt("age"));
                student.setGender(rst.getString("gender"));
                student.setEmail(rst.getString("email"));
                list.add(student);
            }
            rst.close(); // 关闭
            pst.close(); // 关闭
        } catch (SQLException e) {
            e.printStackTrace(); // 抛出异常
        }
        return list; // 返回一个集合
    }

    public boolean deleteBatchStudent(List<String> idList) {
        Connection conn = DbHelper.getConnection();
        if (idList.size() > 0) {
            String[] strIdList = null;
            for (int j = 0; j < idList.size(); j++) {
                strIdList[j] = idList.get(j);
                System.out.println(strIdList[j]);
                System.out.println(idList.get(j));

                String sql = "delete from student where studentId  = '" + strIdList[j] + "'";
                System.out.println(sql);
                try {
                    PreparedStatement pst = conn.prepareStatement(sql);
                    int count = pst.executeUpdate();
                    pst.close();
                    return count > 0 ? true : false; // 是否删除的判断
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return false;
            }
        }
        return false;
    }

    }