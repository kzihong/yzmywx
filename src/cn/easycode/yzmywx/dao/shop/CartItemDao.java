package cn.easycode.yzmywx.dao.shop;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;

import cn.easycode.yzmywx.bean.eo.Customer;
import cn.easycode.yzmywx.bean.eo.shop.Cartitem;
import cn.easycode.yzmywx.bean.eo.shop.Product;
import cn.easycode.yzmywx.bean.eo.shop.Productcategory;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.OrderUtil;

@Stateless
public class CartItemDao {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;

	public boolean addIntoCart(Cartitem cartitem, HttpServletRequest request) {
		Cartitem cartitem2 = getPersonalCartitem(request, cartitem.getCategoryid());
		if(cartitem2 == null){
			Productcategory productcategory = em.find(Productcategory.class, cartitem.getCategoryid());
			if(productcategory.getInventory() > cartitem.getQuantity()){
				cartitem.setCustomer(getCustomer(request));
				cartitem.setProduct(em.find(Product.class, cartitem.getProductid()));
				cartitem.setProductcategory(productcategory);
				cartitem.setId(OrderUtil.getUUID());
				cartitem.setCreatetime(new Date().getTime());
				cartitem.setModifytime(new Date().getTime());
				em.persist(cartitem);
				return true;
			}else{
				return false ;
			}
		}else{
			int indeed = cartitem.getQuantity()+cartitem2.getQuantity();
			if(cartitem2.getProductcategory().getInventory() >indeed){
				cartitem2.setQuantity(indeed);
				cartitem2.setModifytime(new Date().getTime());
				em.merge(cartitem2);
				return true;
			}else{
				return false;
			}
		}
	}
	
	private Customer getCustomer(HttpServletRequest request) {
		String openid = (String)request.getSession().getAttribute(ConfigUtil.get("customer"));
		Customer customer = new Customer();
		customer.setOpenid(openid);
		Customer customer2 = em.find(Customer.class, customer.getOpenid());
		if(customer2 != null){
			return customer2;
		}else{
			em.persist(customer);
			return customer;
		}
	}
	
	public boolean removeCartItem(String cartitemid){
		em.remove(em.find(Cartitem.class, cartitemid));
		return true;
	}
	
	public boolean updateQuantity(String categoryid, int quantity, HttpServletRequest request){
		Productcategory productcategory = em.find(Productcategory.class, categoryid);
		if(productcategory.getInventory() > quantity ){
			Cartitem cartitem = getPersonalCartitem(request, categoryid);
			cartitem.setQuantity(quantity);
			cartitem.setModifytime(new Date().getTime());
			return true ;
		}else{
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Cartitem> getCartitems(HttpServletRequest request){
		request.getSession().setAttribute("customer", "oQ1HdvgOqUiH8rdMPgSrleM5l8tc");
		Query query = em.createQuery("select bean from Cartitem bean where bean.customer.openid = :id");
		query.setParameter("id", request.getSession().getAttribute(ConfigUtil.get("customer")));
		List<Cartitem> list = query.getResultList();
		return list;
	}
	
	private Cartitem getPersonalCartitem(HttpServletRequest request,String categoryid){
		String openidString = (String) request.getSession().getAttribute(ConfigUtil.get("customer"));
		Query query = em.createQuery("select bean from Cartitem bean where bean.customer.openid = :openid and bean.productcategory.id = :categoryid");
		query.setParameter("openid", openidString);
		query.setParameter("categoryid", categoryid);
		@SuppressWarnings("unchecked")
		List<Cartitem> list = query.getResultList();
		if(list.size() == 1){
			return list.get(0);
		}else {
			return null;
		}
	}
}
