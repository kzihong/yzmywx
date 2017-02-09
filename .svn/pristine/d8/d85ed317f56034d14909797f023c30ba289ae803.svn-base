package cn.easycode.yzmywx.bean.vo.wechat;

import java.util.List;

public class NewsMessage extends BaseMessage{
	public NewsMessage(){}
	public NewsMessage (BaseMessage bm)
	{
		this.setToUserName(bm.getToUserName());
		this.setCreateTime(bm.getCreateTime());
		this.setFromUserName(bm.getFromUserName());
		this.setMsgId(bm.getMsgId());
		this.setMsgType(bm.getMsgType());
	}
	private int ArticleCount;
	private List<News> Articles;
	public int getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}
	public List<News> getArticles() {
		return Articles;
	}
	public void setArticles(List<News> articles) {
		Articles = articles;
	}
}
