package cn.itcast.utils;

import cn.itcast.domain.Employee;
import cn.itcast.domain.PageBean;
import org.junit.Test;

public class PageBeanInfoTest {

    @Test
    public void test(){
        PageBean<Employee> pageBean = new PageBean<>();
        pageBean.setPageSize(5);
        pageBean.setCurrentPage(6);
        pageBean.setTotalCounts(44);
        pageBean.setTotalPages(9);
        PageBeanInfo pageBeanInfo = new PageBeanInfo(pageBean, 5);
        System.out.println(pageBeanInfo);
    }
}
