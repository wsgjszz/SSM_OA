package cn.itcast.domain;

import java.io.Serializable;

public class Department implements Serializable {

    private Integer dep_id;
    private String dep_name;
    private Integer dep_num;

    public Department() {
    }

    public Department(Integer dep_id, String dep_name, Integer dep_num) {
        this.dep_id = dep_id;
        this.dep_name = dep_name;
        this.dep_num = dep_num;
    }

    public Integer getDep_id() {
        return dep_id;
    }

    public void setDep_id(Integer dep_id) {
        this.dep_id = dep_id;
    }

    public String getDep_name() {
        return dep_name;
    }

    public void setDep_name(String dep_name) {
        this.dep_name = dep_name;
    }

    public Integer getDep_num() {
        return dep_num;
    }

    public void setDep_num(Integer dep_num) {
        this.dep_num = dep_num;
    }

    @Override
    public String toString() {
        return "Department{" +
                "dep_id=" + dep_id +
                ", dep_name='" + dep_name + '\'' +
                ", dep_num=" + dep_num +
                '}';
    }
}
