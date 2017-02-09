package cn.easycode.yzmywx.bean.vo.wechat;

import java.util.List;

import cn.easycode.yzmywx.bean.eo.Workergroup;

public class FansGroups {

	private List<Group> groups;
	
	private List<Workergroup> workergroups;

	public List<Group> getGroups() {
		return groups;
	}

	public void setGroups(List<Group> groups) {
		this.groups = groups;
	}

	public List<Workergroup> getWorkergroups() {
		return workergroups;
	}

	public void setWorkergroups(List<Workergroup> workergroups) {
		this.workergroups = workergroups;
	}
	
	
}
