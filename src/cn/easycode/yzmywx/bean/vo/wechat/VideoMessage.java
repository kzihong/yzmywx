package cn.easycode.yzmywx.bean.vo.wechat;

public class VideoMessage extends BaseMessage{
	public VideoMessage(){}
	public VideoMessage(BaseMessage bm)
	{
		this.setCreateTime(bm.getCreateTime());
		this.setFromUserName(bm.getFromUserName());
		this.setToUserName(bm.getToUserName());
		this.setMsgId(bm.getMsgId());
		this.setMsgType(bm.getMsgType());
	}
	Video Video;
	public Video getVideo() {
		return Video;
	}
	public void setVideo(Video video) {
		Video = video;
	}
	
}
