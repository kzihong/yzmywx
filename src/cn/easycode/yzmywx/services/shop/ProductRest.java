package cn.easycode.yzmywx.services.shop;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.faces.component.behavior.AjaxBehavior;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import org.codehaus.jackson.map.ObjectMapper;

import cn.easycode.yzmywx.bean.eo.shop.Product;
import cn.easycode.yzmywx.bean.eo.shop.Producttype;
import cn.easycode.yzmywx.bean.vo.Grid;
import cn.easycode.yzmywx.bean.vo.RequestData;
import cn.easycode.yzmywx.bean.vo.ReturnData;
import cn.easycode.yzmywx.bean.vo.order.Products;
import cn.easycode.yzmywx.dao.shop.ProductDao;

@Stateless
@Path("product")
public class ProductRest {
	@EJB
	ProductDao productDao;
	
	@SuppressWarnings("finally")
	@Path("persist")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData persist(Product product){
		ReturnData returnData = new ReturnData(); 
		if(product == null ){
			returnData.setSuccess(false);
			returnData.setErrmsg("数据出错");
			return returnData;
		}
		try {
			if(productDao.persist(product)){
				returnData.setSuccess(true);
				returnData.setErrmsg("保存成功");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("数据出错");
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("update/{productid}")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData merge(Product product,@PathParam("productid") String productid){
		ReturnData returnData = new ReturnData(); 
		if(product == null ){
			returnData.setSuccess(false);
			returnData.setErrmsg("数据出错");
			return returnData;
		}
		try {
			if(productDao.merge(product,productid)){
				returnData.setSuccess(true);
				returnData.setErrmsg("保存成功");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("数据出错");
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("getByID/{id}")
	@GET
	@Produces("application/json")
	public String getById(@PathParam("id") String orderid){
		Product product = null ;
		ObjectMapper mapper = new ObjectMapper();
		try {
			product = productDao.getByID(orderid);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}finally{
			try {return mapper.writeValueAsString(product);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("productList")
	@POST
	@Produces("application/json")
	@Consumes("application/x-www-form-urlencoded")
	public String getProductList(@FormParam("productSn") Long productSn,@FormParam("producttype") String producttype,
								@FormParam("new") String isnew , @FormParam("hot") String ishot ,@FormParam("active") String isactive,
								@FormParam("page") Integer page, @FormParam("rows") Integer rows,
								@FormParam("sort") String sort, @FormParam("order") String order){
		ObjectMapper mapper = new ObjectMapper();
		Boolean isHot = null;
		Boolean isNew = null;
		Boolean isActive = null;
		if(isnew != null){
			isNew = ("1").equals(isnew)? true:false;
		}
		if(isactive != null){
			isActive = ("1").equals(isactive)? true:false;
		}
		if(ishot != null){
			isHot = ("1").equals(ishot)? true:false;
		}
		Grid returnjson = new Grid();
		try{
			Long total = productDao.getProductListSize(productSn,producttype,isNew,isActive,isHot);
			if(total > 0){
				returnjson.setTotal(total);
				returnjson.setRows(productDao.getProductList(page, rows,productSn,producttype,isNew,isActive,isHot,sort,order));
			}
		}catch(Exception e){
			returnjson = new Grid();
		}finally{
			try {return mapper.writeValueAsString(returnjson);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("getProductTypeList")
	@POST
	@Produces("application/json")
	public String getTypeList(){
		ObjectMapper mapper = new ObjectMapper();
		List<Producttype> list = null;
		try {
			list = productDao.getTypeList();
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}finally{
			try {return mapper.writeValueAsString(list);} catch (Exception e) {return null;}
		}
	}
	
	@SuppressWarnings("finally")
	@Path("deleteProduct")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData deleteProduct(Products products){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.deleteProduct(products.getProducts())){
				returnData.setSuccess(true);
				returnData.setErrmsg("操作成功");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("未知错误，请联系超级管理员");
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("inactive")
	@POST
	@Produces("application/json")
	@Consumes("application/json")
	public ReturnData inactiveProducts(Products products){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.inactiveProduct(products.getProducts())){
				returnData.setSuccess(true);
				returnData.setErrmsg("下架成功");
			}else{
				returnData.setSuccess(false);
				returnData.setErrmsg("未知错误，请联系超级管理员");
			}
		} catch (Exception e) {
			e.printStackTrace();
			returnData.setSuccess(false);
			returnData.setErrmsg(e.toString());
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("setNew/{id}")
	@POST
	@Produces("application/json")
	public ReturnData setNew(@PathParam("id") String id){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.setNew(id)){
				returnData.setSuccess(true);
				returnData.setErrmsg("设置新品成功");
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnData.setErrmsg("数据出错");
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("cancelNew/{id}")
	@POST
	@Produces("application/json")
	public ReturnData cancelNew(@PathParam("id") String id){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.cancelNew(id)){
				returnData.setSuccess(true);
				returnData.setErrmsg("取消新品成功");
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnData.setErrmsg("数据出错");
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("cancelHot/{id}")
	@POST
	@Produces("application/json")
	public ReturnData cancelHot(@PathParam("id") String id){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.cancelHot(id)){
				returnData.setSuccess(true);
				returnData.setErrmsg("取消热销成功");
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnData.setErrmsg("数据出错");
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("setHot/{id}")
	@POST
	@Produces("application/json")
	public ReturnData setHot(@PathParam("id") String id){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.setHot(id)){
				returnData.setSuccess(true);
				returnData.setErrmsg("设置热销成功");
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnData.setErrmsg("数据出错");
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("setActive/{id}")
	@POST
	@Produces("application/json")
	public ReturnData setActive(@PathParam("id") String id){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.setActive(id)){
				returnData.setSuccess(true);
				returnData.setErrmsg("上架成功");
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnData.setErrmsg("数据出错");
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("cancelActive/{id}")
	@POST
	@Produces("application/json")
	public ReturnData cancelActive(@PathParam("id") String id){
		ReturnData returnData = new ReturnData();
		try {
			if(productDao.cancelActive(id)){
				returnData.setSuccess(true);
				returnData.setErrmsg("下架成功");
			}else{
				returnData.setErrmsg("数据出错");
				returnData.setSuccess(false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			returnData.setErrmsg("数据出错");
			returnData.setSuccess(false);
		}finally{
			return returnData;
		}
	}
	
	@SuppressWarnings("finally")
	@Path("getIndexData")
	@GET
	@Produces("application/json")
	public String getHot(){
		String returnString = null;
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			List<Product> products_hot = productDao.getHot();
			List<Product> products_1001 = productDao.getCategoryList("1001");
			List<Product> products_2001 = productDao.getCategoryList("2001");
			returnString ="{'hot':";
			returnString += objectMapper.writeValueAsString(products_hot);
			returnString += ",'door':";
			returnString += objectMapper.writeValueAsString(products_1001);
			returnString += ",'sd':";
			returnString += objectMapper.writeValueAsString(products_2001);
			returnString += "}";
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return returnString.replace("'", "\"");
		}
	}
	
	@SuppressWarnings("finally")
	@Path("getDataByType")
	@POST
	@Produces("application/json")
	public String getDataByType(RequestData requestData){
		String returnString = null;
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			List<Product> products = productDao.getDataByType(requestData);
			returnString = objectMapper.writeValueAsString(products);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			return returnString.replace("'", "\"");
		}
	}
}
