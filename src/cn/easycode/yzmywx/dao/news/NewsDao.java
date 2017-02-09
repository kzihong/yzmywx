package cn.easycode.yzmywx.dao.news;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import cn.easycode.yzmywx.bean.eo.Companynew;


@Stateless
public class NewsDao {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<Companynew> getNews(){
		Query query = em.createQuery("select c from Companynew c ");
		List<Companynew> list = query.getResultList();
		return list;
	}

	public Companynew getById(String newsId){
		return em.find(Companynew.class, newsId);
	}

	public boolean save(Companynew companynew){
		em.persist(companynew);
		return true;
	}
	
	public boolean merge(Companynew companynew){
		em.merge(companynew);
		return true;
	}
	
	public boolean delete(String newsId) {
		em.remove(em.find(Companynew.class, newsId));
		return true;
	}


	@SuppressWarnings("unchecked")
	public List<Companynew> getByCondition(Integer page, Integer rows, String title, Date date, String sort, String order) {
		String query_sql = "select c from Companynew c where 1=1 ";
		String where_sql = "";
		//时间
		if (null != date) {
			where_sql += " and c.createtime between :today and :tomorrow ";
		}
		//标题
		if (null != title) {
			where_sql += " and c.title like :title ";
		}

		String order_sql = " order by c.createtime desc ";
		if (null != sort && !"".equals(sort)) {
			order_sql = " order by c." + sort;
			if (null != order && !"".equals(order)) {
				order_sql += " " + order;
			}
		}
		Query query = em.createQuery(query_sql + where_sql + order_sql);

		if (null != date) {
			long today = date.getTime();
			long tomorrow = today + 1000*3600*24;
			query.setParameter("today", today);
			query.setParameter("tomorrow", tomorrow);
		}
		if (null != title) {
			query.setParameter("title", "%" + title + "%");
		}

		if (null == rows)
			rows = 10;
		if (null == page)
			page = 1;

		query.setMaxResults(rows);
		query.setFirstResult((page - 1) * rows);
		List<Companynew> rolelist = query.getResultList();
		return rolelist;
	}

	public Long getSize(String title, Date date) {
		Long total = 0l;
		String count_sql = "select count(c) from Companynew c where 1=1 ";
		String where_sql = "";
		//时间
		if (null != date) {
			where_sql += " and c.createtime between :today and :tomorrow ";
		}
		//标题
		if (null != title) {
			where_sql += " and c.title like :title ";
		}

		Query query = em.createQuery(count_sql + where_sql);

		if (null != date) {
			long today = date.getTime();
			long tomorrow = today + 1000*3600*24;
			query.setParameter("today", today);
			query.setParameter("tomorrow", tomorrow);
		}
		
		if (null != title) {
			query.setParameter("title", "%" + title + "%");
		}
		Object object = query.getSingleResult();
		if (null != object) {
			total = (Long) object;
		}

		return total;
	}
	
	
	
}
