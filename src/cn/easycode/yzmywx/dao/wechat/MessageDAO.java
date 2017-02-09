package cn.easycode.yzmywx.dao.wechat;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import cn.easycode.yzmywx.bean.eo.Accesstoken;
import cn.easycode.yzmywx.bean.eo.Customer;
import cn.easycode.yzmywx.bean.eo.Keyword;
import cn.easycode.yzmywx.bean.vo.wechat.BaseMessage;
import cn.easycode.yzmywx.bean.vo.wechat.Image;
import cn.easycode.yzmywx.bean.vo.wechat.ImageMessage;
import cn.easycode.yzmywx.bean.vo.wechat.Music;
import cn.easycode.yzmywx.bean.vo.wechat.MusicMessage;
import cn.easycode.yzmywx.bean.vo.wechat.TextMessage;
import cn.easycode.yzmywx.bean.vo.wechat.Video;
import cn.easycode.yzmywx.bean.vo.wechat.VideoMessage;
import cn.easycode.yzmywx.bean.vo.wechat.Voice;
import cn.easycode.yzmywx.bean.vo.wechat.VoiceMessage;
import cn.easycode.yzmywx.utils.ConfigUtil;
import cn.easycode.yzmywx.utils.WeixinUtil;


@Stateless
public class MessageDAO {
	@PersistenceContext(unitName = "yzmywx")
	private EntityManager em;
	
	public String handleMessage(Map<String, String> map)  throws Exception{
		String backMsg = null;
		System.out.println("接受的消息MAP="+map);
		if(map != null){
			String fromUserName = map.get("FromUserName");
			String toUserName = map.get("ToUserName");
			String msgType = map.get("MsgType");
			System.out.println(toUserName);
			System.out.println(fromUserName);
			if(msgType.equals("text")){
				BaseMessage bm = new BaseMessage();
				String content = map.get("Content");
				
				String jpql = "select keyword from Keyword keyword where keyword.keyword LIKE :keyword";
				Query query = em.createQuery(jpql);
				query.setParameter("keyword", "%"+ content +"%");
				@SuppressWarnings("unchecked")
				List<Keyword> klist =  query.getResultList();
				bm.setCreateTime(Long.toString(new Date().getTime()));
				bm.setFromUserName(toUserName);
				bm.setToUserName(fromUserName);
				if(klist.size() > 0){
					bm.setMsgType(klist.get(0).getMsgtype());
					if(klist.get(0).getMsgtype().equals("text")){
						TextMessage tm = new TextMessage(bm);
						tm.setContent(klist.get(0).getContent());
						return WeixinUtil.generalToXml(tm);
					}
					else if(klist.get(0).getMsgtype().equals("image")){
						ImageMessage imm = new ImageMessage(bm);
						Image im = new Image();
						im.setMediaId(klist.get(0).getMediaid());
						im.setPicUrl(klist.get(0).getPicurl());
						imm.setImage(im);
						return WeixinUtil.generalToXml(imm);
					}else if(klist.get(0).getMsgtype().equals("voice")){
						VoiceMessage vm = new VoiceMessage(bm);
						Voice voice = new Voice();
						voice.setFormat(klist.get(0).getFormat());
						voice.setMediaId(klist.get(0).getMediaid());
						vm.setVoice(voice);
						return WeixinUtil.generalToXml(vm);
					}else if(klist.get(0).getMsgtype().equals("video")){
						VideoMessage vi  = new VideoMessage(bm);
						Video vim = new Video();
						vim.setMediaId(klist.get(0).getMediaid());
						vim.setThumbMediaId(klist.get(0).getThumbmediaid());
						vi.setVideo(vim);
						return WeixinUtil.generalToXml(vi);
					}else if(klist.get(0).getMsgtype().equals("music")){
						MusicMessage mmm = new MusicMessage(bm);
						Music mm = new Music();
						mm.setDescription(klist.get(0).getDescription());
						mm.setHQMusicUrl(klist.get(0).getHqmusicurl());
						mm.setMusicURL(klist.get(0).getPicurl());
						mm.setThumbMediaId(klist.get(0).getThumbmediaid());
						mm.setTitle(klist.get(0).getTitle());
						mmm.setMusic(mm);
						return WeixinUtil.generalToXml(mm);
					}else if(klist.get(0).getMsgtype().equals("news")){}
				}
			}else if(msgType.equals("image")){
			}else if(msgType.equals("voice")){
			}else if(msgType.equals("video") || msgType.equals("shortvideo")){
			}else if(msgType.equals("link")){
			}else if(msgType.equals("location")){
				
			}else if(msgType.equals("event")){
				String event = map.get("Event");
				
				if(event.equals("subscribe")){
					Keyword keyword = em.find(Keyword.class, event);
					BaseMessage bm = new BaseMessage();
					bm.setCreateTime(Long.toString(new Date().getTime()));
					bm.setFromUserName(toUserName);
					bm.setToUserName(fromUserName);
					bm.setMsgType(keyword.getMsgtype());
					if(keyword.getMsgtype().equals("text")){
						TextMessage tm = new TextMessage(bm);
						tm.setContent(keyword.getContent());
						return WeixinUtil.generalToXml(tm);
					}else if(keyword.getMsgtype().equals("image")){
						ImageMessage imm = new ImageMessage(bm);
						Image im = new Image();
						im.setMediaId(keyword.getMediaid());
						im.setPicUrl(keyword.getPicurl());
						imm.setImage(im);
						return WeixinUtil.generalToXml(imm);
					}else if(keyword.getMsgtype().equals("voice")){
						VoiceMessage vm = new VoiceMessage(bm);
						Voice voice = new Voice();
						voice.setFormat(keyword.getFormat());
						voice.setMediaId(keyword.getMediaid());
						vm.setVoice(voice);
						return WeixinUtil.generalToXml(vm);
					}else if(keyword.getMsgtype().equals("video")){
						VideoMessage vi  = new VideoMessage(bm);
						Video vim = new Video();
						vim.setMediaId(keyword.getMediaid());
						vim.setThumbMediaId(keyword.getThumbmediaid());
						vi.setVideo(vim);
						return WeixinUtil.generalToXml(vi);
					}else if(keyword.getMsgtype().equals("music")){
						MusicMessage mmm = new MusicMessage(bm);
						Music mm = new Music();
						mm.setDescription(keyword.getDescription());
						mm.setHQMusicUrl(keyword.getHqmusicurl());
						mm.setMusicURL(keyword.getPicurl());
						mm.setThumbMediaId(keyword.getThumbmediaid());
						mm.setTitle(keyword.getTitle());
						mmm.setMusic(mm);
						return WeixinUtil.generalToXml(mm);
					}else if(keyword.getMsgtype().equals("news")){}
				}else if(event.equals("unsubscribe")){
				}else if(event.equals("VIEW")){
					
				}else if(event.equals("CLICK")){
					
				}else if(event.equals("LOCATION")){
					String openid = fromUserName;
					Customer customer = em.find(Customer.class, openid);
					if(customer == null){
						customer = new Customer();
						customer.setOpenid(openid);
						customer.setLatitude(map.get("Latitude"));
						customer.setLongitude(map.get("Longitude"));
						customer.setLocationprecision(map.get("Precision"));
						em.persist(customer);
					}else{
						customer.setLatitude(map.get("Latitude"));
						customer.setLongitude(map.get("Longitude"));
						customer.setLocationprecision(map.get("Precision"));
					}
				}
			}
			
		}
		return backMsg;
	}
	
	
	public String getAT() throws Exception{
		Accesstoken at = em.find(Accesstoken.class, "1");
		if(at != null){
			if(new Date().getTime() - at.getCreatetime().getTime() < 1000*3600){
				return at.getToken();
			}else{
				at.setCreatetime(new Date());
				at.setToken(WeixinUtil.getAccessToken(ConfigUtil.get("appid"),ConfigUtil.get("appsecret")));
				em.merge(at);
				return at.getToken();
			}
		}else{
			at = new Accesstoken();
			at.setCreatetime(new Date());
			at.setToken(WeixinUtil.getAccessToken(ConfigUtil.get("appid"),ConfigUtil.get("appsecret")));
			at.setId("1");
			em.persist(at);
			return at.getToken();
		}
	}
	
	public String getJSapi() throws Exception{
		Accesstoken at = em.find(Accesstoken.class, "2");
		if(at != null){
			if(new Date().getTime() - at.getCreatetime().getTime() < 1000*5400){
				return at.getToken();
			}else{
				at.setCreatetime(new Date());
				at.setToken(WeixinUtil.getJsApi(getAT()));
				em.merge(at);
				return at.getToken();
			}
		}else{
			at = new Accesstoken();
			at.setCreatetime(new Date());
			at.setToken(WeixinUtil.getJsApi(getAT()));
			at.setId("2");
			em.persist(at);
			return at.getToken();
		}
	}
}
