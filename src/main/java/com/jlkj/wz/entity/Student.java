package com.jlkj.wz.entity;

import com.jlkj.wz.util.ExcelField;

import java.io.Serializable;

/**
 * @Auther:
 * @Date: 2019/3/10 14:03
 * @Description:
 */
public class Student  implements Serializable {

    private int id; //序号

    private String studentId; //学号

    private String userName; //姓名

    private int age;    //年龄

    private String gender; //性别

    private String email;  //邮箱

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ExcelField(title = "学号", type = 0, align = 2, sort =1)
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    @ExcelField(title = "姓名", type = 0, align = 2, sort =5)
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    @ExcelField(title = "年龄", type = 0, align = 2, sort =10)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    @ExcelField(title = "性别", type = 0, align = 2, sort =15)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    @ExcelField(title = "邮箱", type = 0, align = 2, sort =20)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}