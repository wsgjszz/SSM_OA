package cn.itcast.utils;

import cn.itcast.domain.Employee;
import cn.itcast.domain.PageBean;
import org.junit.Test;

public class PageBeanInfoTest {

    @Test
    public void test(){
        PageBean<Employee> pageBean = new PageBean<>();
        pageBean.setPageSize(5);
        pageBean.setCurrentPage(1);
        pageBean.setTotalCounts(33);
        pageBean.setTotalPages(7);
        PageBeanInfo pageBeanInfo = new PageBeanInfo(pageBean, 3);
        System.out.println(pageBeanInfo);
    }
}
