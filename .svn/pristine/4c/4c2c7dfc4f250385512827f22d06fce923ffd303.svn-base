package cn.easycode.yzmywx.dao.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import cn.easycode.yzmywx.bean.eo.Companynew;

public class CustomerClient {

	  public static void main(String[] args) {

	        EntityManagerFactory emf = Persistence

	                .createEntityManagerFactory("yzmywx");

	        EntityManager entityManager = emf.createEntityManager();

	        try {

	            /** 事务开始 */

	            entityManager.getTransaction().begin();

	            Companynew companynew = new Companynew();

	            companynew.setTitle("测试事务管理");

	            /** 事务提交 */

	            entityManager.getTransaction().commit();

	        } finally {

	            entityManager.close();

	            emf.close();

	        }

	    }

}
