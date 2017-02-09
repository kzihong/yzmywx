package cn.easycode.yzmywx.dao.shop;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import cn.easycode.yzmywx.bean.eo.shop.Product;
import cn.easycode.yzmywx.bean.eo.shop.Productattr;
import cn.easycode.yzmywx.bean.eo.shop.Productcategory;
import cn.easycode.yzmywx.bean.eo.shop.Producttype;
import cn.easycode.yzmywx.bean.vo.RequestData;
import cn.easycode.yzmywx.utils.OrderUtil;

@Stateless
public class ProductDao {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;
	
	public boolean persist(Product product) {
		product.setId(UUID.randomUUID().toString());
		product.setCreatetime(new Date().getTime());
		product.setActive(true);
		for(Productcategory productcategory : product.getProductcategorys()){
			productcategory.setId(OrderUtil.getUUID());
			productcategory.setProduct(product);
		}
		for(Productattr productattr : product.getProductattrs()){
			productattr.setId(OrderUtil.getUUID());
			productattr.setProduct(product);
		}
		product.setProducttype(em.find(Producttype.class, product.getProducttypeid()));
		product.setProductSn(OrderUtil.getSn());
		em.persist(product);
		return true;
	}

	public boolean updateProduct(Product product){
		return true;
	}
	
	public boolean inactiveProduct(List<Product> list){
		Product product = null;
		for(Product product_temp : list){
			product = em.find(Product.class, product_temp.getId());
			product.setActive(false);
			product.setHot(false);
			product.setNew(false);
		}
		return true;
	}
	
	public Product getByID(String orderid){
		return em.find(Product.class, orderid);
	}

	public Long getProductListSize(Long productSn, String producttype,
			Boolean isNew, Boolean isActive, Boolean isHot) {
		Long total = 0l;
		
		String count_sql = "select count(bean) from Product bean where 1=1 ";
		String where_sql = "";
		if(null != productSn){
			where_sql += " and bean.productSn = :productSn ";
		}
		if(null != producttype){
			where_sql += " and bean.producttype.id = :producttype ";
		}
		if(null != isNew){
			where_sql += " and bean.isNew = :isNew ";
		}
		if(null != isHot){
			where_sql += " and bean.isHot = :isHot ";
		}
		if(null != isActive){
			where_sql += " and bean.active = :isActive ";
		}
		Query query = em.createQuery(count_sql + where_sql);
		
		if(null != producttype){
			query.setParameter("producttype", producttype);
		}
		if(null != productSn){
			query.setParameter("productSn", productSn);
		}
		if(null != isActive){
			query.setParameter("isActive", isActive);
		}
		if(null != isHot){
			query.setParameter("isHot", isHot);
		}
		if(null != isNew){
			query.setParameter("isNew", isNew);
		}
		Object object = query.getSingleResult();
		if(null != object){
			total = (Long)object;
		}
		return total;
	}

	@SuppressWarnings("unchecked")
	public List<Product> getProductList(Integer page, Integer rows, Long productSn,
			String producttype, Boolean isNew, Boolean isActive, Boolean isHot, String sort, String order) {
		String query_sql = "select bean from Product bean where 1=1 ";
		String where_sql = "";
		if(null != productSn){
			where_sql += " and bean.productSn = :productSn ";
		}
		if(null != producttype){
			where_sql += " and bean.producttype.id = :producttype ";
		}
		if(null != isNew){
			where_sql += " and bean.isNew = :isNew ";
		}
		if(null != isHot){
			where_sql += " and bean.isHot = :isHot ";
		}
		if(null != isActive){
			where_sql += " and bean.active = :isActive ";
		}
		String order_sql = "order by bean.createtime desc";	
		if(null != sort){
			if(sort.equals("productSn")){
				order_sql = "order by bean.productSn ";
			}else if (sort.equals("formatcreatetime")) {
				order_sql = "order by bean.createtime ";
			}else if (sort.equals("price")) {
				order_sql = "order by bean.price " ;
			}else if (sort.equals("productsales")) {
				order_sql = "order by bean.productsales ";
			}
		}
		if(null != order){
			order_sql += order;
		}
		Query query = em.createQuery(query_sql + where_sql + order_sql);
		
		if(null != producttype){
			query.setParameter("producttype", producttype);
		}
		if(null != productSn){
			query.setParameter("productSn", productSn);
		}
		if(null != isActive){
			query.setParameter("isActive", isActive);
		}
		if(null != isHot){
			query.setParameter("isHot", isHot);
		}
		if(null != isNew){
			query.setParameter("isNew", isNew);
		}
		if(null == rows) rows = 10;
		if(null == page) page = 1;
		
		query.setMaxResults(rows);
		query.setFirstResult((page - 1) * rows);
		
		List<Product> products = query.getResultList();
		return products;
	}

	@SuppressWarnings("unchecked")
	public List<Producttype> getTypeList() {
		return em.createQuery("select bean from Producttype bean ").getResultList();
	}

	public boolean deleteProduct(List<Product> products) {
		for(Product product : products){
			em.remove(em.find(Product.class, product.getId()));
		}
		return true;
	}

	public boolean setHot(String id) {
		em.find(Product.class, id).setHot(true);
		return true;
	}

	public boolean cancelHot(String id) {
		em.find(Product.class, id).setHot(false);
		return true;
	}

	public boolean cancelNew(String id) {
		em.find(Product.class, id).setNew(false);
		return true;
	}

	public boolean setNew(String id) {
		em.find(Product.class, id).setNew(true);
		return true;
	}

	public boolean setActive(String id) {
		em.find(Product.class, id).setActive(true);
		return true;
	}

	public boolean cancelActive(String id) {
		Product product = em.find(Product.class, id);
		product.setActive(false);
		product.setHot(false);
		product.setNew(false);
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<Product> getHot() {
		Query query = em.createQuery("select bean from Product bean where bean.isHot = 1");
		query.setMaxResults(3);
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Product> getCategoryList(String typeid) {
		Query query = em.createQuery("select bean from Product bean where bean.producttype.id = :typeid");
		query.setParameter("typeid", typeid);
		query.setMaxResults(3);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Product> getDataByType(RequestData requestData) {
		Producttype producttype = null;
		if(requestData.getRequestData().equals("sd")){
			producttype = em.find(Producttype.class, "2001");
			
		}else if(requestData.getRequestData().equals("")){
			producttype = em.find(Producttype.class, "");
		}
		else if(requestData.getRequestData().equals("")){
			producttype = em.find(Producttype.class, "");
		}
		Query query = em.createQuery("select bean from Product bean where bean.producttype  = :id");
		query.setParameter("id", producttype);
		
		int rows = requestData.getRows();
		int page = requestData.getPage();
		
		query.setMaxResults(rows);
		query.setFirstResult((page - 1) * rows);
		return query.getResultList();
	}

	public boolean merge(Product product, String productid) {
		Product product_eo = em.find(Product.class, productid);
		product_eo.setActive(product.isActive());
		product_eo.setHot(product.isHot());
		product_eo.setNew(product.isNew());
		product_eo.setDescription(product.getDescription());
		product_eo.setName(product.getName());
		product_eo.setPhotoUrl(product.getPhotoUrl());
		product_eo.setPrice(product.getPrice());
		product_eo.setPicgroup(product.getPicgroup());
		List<Productcategory> productcategories = product_eo.getProductcategorys();
		for(int i = productcategories.size(); i > 0 ; i --){
			em.find(Productcategory.class, productcategories.get(i-1).getId()).setProduct(null);
		}
		product_eo.setProductcategorys(new ArrayList<Productcategory>());
		for(Productcategory productcategory:product.getProductcategorys()){
			productcategory.setId(OrderUtil.getUUID());
			product_eo.addProductcategory(productcategory);
		}
		List<Productattr> productattrs = product_eo.getProductattrs();
		for(int i = productattrs.size(); i > 0 ; i --){
			em.find(Productattr.class, productattrs.get(i-1).getId()).setProduct(null);
		}
		product_eo.setProductattrs(new ArrayList<Productattr>());
		for(Productattr productattr : product.getProductattrs()){
			productattr.setId(OrderUtil.getUUID());
			product_eo.addProductattr(productattr);
		}
		product_eo.setProducttype(em.find(Producttype.class, product.getProducttypeid()));
		em.flush();
		Query query = em.createQuery("delete from Productcategory as o where o.product = null"); 
		query.executeUpdate();//delete
		query = em.createQuery("delete from Productattr as o where o.product = null");
		query.executeUpdate();
		return true;
	}
}
