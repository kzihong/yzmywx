package cn.easycode.yzmywx.bean.vo.wechat;

public class MusicMessage extends BaseMessage {
	public MusicMessage(){}
	public MusicMessage(BaseMessage bm)
	{
		this.setCreateTime(bm.getCreateTime());
		this.setFromUserName(bm.getFromUserName());
		this.setToUserName(bm.getToUserName());
		this.setMsgId(bm.getMsgId());
		this.setMsgType(bm.getMsgType());
	}
	Music Music;
	public Music getMusic() {
		return Music;
	}
	public void setMusic(Music music) {
		Music = music;
	}
}
