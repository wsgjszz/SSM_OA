package cn.itcast.domain;

import java.io.Serializable;

public class Employee implements Serializable {

    private Integer emp_id;
    private String emp_name;
    private String emp_position;
    private String emp_gender;
    private Integer emp_age;
    private Integer dep_id;

    public Employee() {
    }

    public Employee(Integer emp_id, String emp_name, String emp_position, String emp_gender, Integer emp_age, Integer dep_id) {
        this.emp_id = emp_id;
        this.emp_name = emp_name;
        this.emp_position = emp_position;
        this.emp_gender = emp_gender;
        this.emp_age = emp_age;
        this.dep_id = dep_id;
    }

    public Integer getEmp_id() {
        return emp_id;
    }

    public void setEmp_id(Integer emp_id) {
        this.emp_id = emp_id;
    }

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getEmp_position() {
        return emp_position;
    }

    public void setEmp_position(String emp_position) {
        this.emp_position = emp_position;
    }

    public String getEmp_gender() {
        return emp_gender;
    }

    public void setEmp_gender(String emp_gender) {
        this.emp_gender = emp_gender;
    }

    public Integer getEmp_age() {
        return emp_age;
    }

    public void setEmp_age(Integer emp_age) {
        this.emp_age = emp_age;
    }

    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "emp_id=" + emp_id +
                ", emp_name='" + emp_name + '\'' +
                ", emp_position='" + emp_position + '\'' +
                ", emp_gender='" + emp_gender + '\'' +
                ", emp_age=" + emp_age +
                ", dep_id=" + dep_id +
                '}';
    }
}
