package cn.easycode.yzmywx.bean.vo.wechat;

public class VoiceMessage extends BaseMessage {
	Voice Voice;
	public Voice getVoice() {
		return Voice;
	}
	public void setVoice(Voice voice) {
		this.Voice = voice;
	}
	public VoiceMessage(){}
	public VoiceMessage(BaseMessage bm)
	{
		this.setCreateTime(bm.getCreateTime());
		this.setFromUserName(bm.getFromUserName());
		this.setToUserName(bm.getToUserName());
		this.setMsgId(bm.getMsgId());
		this.setMsgType(bm.getMsgType());
	}
	
}
