package cn.easycode.yzmywx.dao.system;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.PathParam;

import org.apache.commons.lang3.StringUtils;

import cn.easycode.yzmywx.bean.eo.Resource;
import cn.easycode.yzmywx.bean.eo.Resourcetype;
import cn.easycode.yzmywx.bean.eo.Role;
import cn.easycode.yzmywx.bean.eo.User;
import cn.easycode.yzmywx.bean.vo.Attributes;
import cn.easycode.yzmywx.bean.vo.ResourceTreeGrid;
import cn.easycode.yzmywx.bean.vo.Tree;


@Stateless
public class ResourceDao {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;
	
	public ResourceDao(){}
	
	public void save(Resource resource) throws Exception {
		resource.setId(resource.getId());
		resource.setResourcetype(em.getReference(Resourcetype.class, resource.getResourcetypeid()));
		em.persist(resource);
	}
	
	public void update(Resource resource) throws Exception{
		Resource oldresource = em.find(Resource.class, resource.getId());
		oldresource.setName(resource.getName());
		oldresource.setUrl(resource.getUrl());
		oldresource.setIconCls(resource.getIconCls());
		oldresource.setPid(resource.getPid());
		oldresource.setTarget(resource.getTarget());
		oldresource.setResourcetype(em.getReference(Resourcetype.class, resource.getResourcetypeid()));
		oldresource.setDescription(resource.getDescription());
		oldresource.setSeq(resource.getSeq());
		em.merge(oldresource);
	}
	
	@SuppressWarnings("unchecked")
	public List<Resourcetype> getResourcetype() throws Exception{
		List<Resourcetype> resourcetypelist = em.createQuery("select bean from Resourcetype bean").getResultList();
		return resourcetypelist;
	}
	
	public Resource find(String id) throws Exception {
		return em.find(Resource.class, id);
	}
	
	public List<Tree> getRoleResources(@PathParam("roleid") String roleid) throws Exception{
		List<Tree> returnlist = new ArrayList<Tree>();
		Role role = em.find(Role.class, roleid);
		if(null != role){
			List<Resource> resourcelist = role.getResources();
			Resource resource = null;
			Tree tree = null;
			for(int i=0; i<resourcelist.size(); i++){
				resource = resourcelist.get(i);
				
				tree = new Tree();
				tree.setId(resource.getId());
				tree.setPid(resource.getPid());
				tree.setText(resource.getName());
				tree.setIconCls(resource.getIconCls());
				Attributes attributes = new Attributes();
				attributes.setUrl(resource.getUrl());
				attributes.setTarget(resource.getTarget());
				tree.setAttributes(attributes);
				returnlist.add(tree);
			}
		}
		
		return returnlist;
	}
	
	@SuppressWarnings("unchecked")
	public List<Tree> getResourcesTree() throws Exception{
		List<Tree> returnlist = new ArrayList<Tree>();
		Query query = em.createQuery("select bean from Resource bean order by bean.seq");
		List<Resource> resourcelist = query.getResultList();
		Resource resource = null;
		Tree tree = null;
		for(int i=0; i<resourcelist.size(); i++){
			resource = resourcelist.get(i);
			
			tree = new Tree();
			tree.setId(resource.getId());
			tree.setPid(resource.getPid());
			tree.setText(resource.getName());
			tree.setIconCls(resource.getIconCls());
			Attributes attributes = new Attributes();
			attributes.setUrl(resource.getUrl());
			attributes.setTarget(resource.getTarget());
			tree.setAttributes(attributes);
			returnlist.add(tree);
		}
		
		return returnlist;
	}
	
	@SuppressWarnings("unchecked")
	public List<Tree> getMenulist() throws Exception{
		List<Tree> returnlist = new ArrayList<Tree>();
		Query query = em.createQuery("select bean from Resource bean where bean.resourcetype.id=:resourcetypeid order by bean.seq");
		query.setParameter("resourcetypeid", "0");
		List<Resource> resourcelist = query.getResultList();
		Resource resource = null;
		Tree tree = null;
		for(int i=0; i<resourcelist.size(); i++){
			resource = resourcelist.get(i);
			
			tree = new Tree();
			tree.setId(resource.getId());
			tree.setPid(resource.getPid());
			tree.setText(resource.getName());
			tree.setIconCls(resource.getIconCls());
			Attributes attributes = new Attributes();
			attributes.setUrl(resource.getUrl());
			attributes.setTarget(resource.getTarget());
			tree.setAttributes(attributes);
			returnlist.add(tree);
		}
		return returnlist;
	}
	
	public List<Tree> getPersonelMenulist(String userid) throws Exception{
		List<Tree> returnlist = new ArrayList<Tree>();
		List<Resource> resourcelist = new ArrayList<Resource>();
		User user = em.find(User.class, userid);
		if(null != user && !StringUtils.isBlank(user.getId())){
			List<Role> rolelist = user.getRoles();
			for(int i=0; i<rolelist.size(); i++){
				for(Resource r : rolelist.get(i).getResources()){
					if(r.getResourcetype().getId().equals("0") && !resourcelist.contains(r)){
						resourcelist.add(r);
					}
				}
			}
			if(resourcelist.size() > 1){
				Collections.sort(resourcelist, new Comparator<Resource>() {
		            public int compare(Resource r1, Resource r2) {
		            	int izt1 = r1.getSeq();
		            	int izt2 = r2.getSeq();
						if (izt1 == izt2)
							return 0;
						if (izt1 > izt2)
							return 1;
						if (izt2 > izt1)
							return -1;
						return 0;
		            }
		        });
			}
			
			Resource resource = null;
			Tree tree = null;
			for(int i=0; i<resourcelist.size(); i++){
				resource = resourcelist.get(i);
				
				tree = new Tree();
				tree.setId(resource.getId());
				tree.setPid(resource.getPid());
				tree.setText(resource.getName());
				tree.setIconCls(resource.getIconCls());
				Attributes attributes = new Attributes();
				attributes.setUrl(resource.getUrl());
				attributes.setTarget(resource.getTarget());
				tree.setAttributes(attributes);
				returnlist.add(tree);
			}
		}
		
		return returnlist;
	}
	
	@SuppressWarnings("unchecked")
	public List<ResourceTreeGrid> getResourceTreeByFatherResourceId(String fatherResourceId) throws Exception{
		List<ResourceTreeGrid> resourceTreelist = new ArrayList<ResourceTreeGrid>();
		Query query = em.createQuery("select resource from Resource resource where resource.pid=:pid order by resource.seq");
		query.setParameter("pid", fatherResourceId);
		List<Resource> resourceList = query.getResultList();
		ResourceTreeGrid resourceTree = null;
		Resource resource = null;
		for(int i=0; i<resourceList.size(); i++){
			resource = resourceList.get(i);
			resourceTree = new ResourceTreeGrid();
			resourceTree.setId(resource.getId());
			resourceTree.setIconCls(resource.getIconCls());
			resourceTree.setPid(resource.getPid());
			resourceTree.setDescription(resource.getDescription());
			resourceTree.setUrl(resource.getUrl());
			resourceTree.setName(resource.getName());
			resourceTree.setSeq(resource.getSeq());
			resourceTree.setTarget(resource.getTarget());
			resourceTree.setResourcetype(resource.getResourcetype());
			
			resourceTree.setChildren(getResourceTreeByFatherResourceId(resource.getId()));
			resourceTreelist.add(resourceTree);
		}
		return resourceTreelist;
	}
}
