package com.care.sys.monitorinfo.domain;

import java.io.Serializable;
import java.util.Date;

import com.godoing.rose.http.PublicVoBean;

/* rose1.2 to files 
 * rose anthor:wlb  1.0 version by time 2005/12/12  
 * rose anthor:wlb  1.1 version by time 2006/06/06  
 * rose anthor:wlb  1.2 version by time 2006/12/27*/
public class MonitorInfo extends PublicVoBean implements Serializable {

	private static final long serialVersionUID = -755661655719465936L;

	public MonitorInfo() {
	}

	private Date startTime;
	private Date endTime;
	private int costTime;
	private int id;
	private String functions;
	private String functionHref;
	private String phone;
	private String belongProject;
    private String switchTag;
    private String type;    //0��ʾapp����,1��ʾ�豸����,2��ʾ����
    private String visit_s;
    private String moni_s;
    private String device_s;
    private Integer len;
    private String userId;
    private String lianJie;
    private String updateTime;
    private String socketName;
    private String lianKey;
    private String reason;
    
    
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLianJie() {
		return lianJie;
	}
	public void setLianJie(String lianJie) {
		this.lianJie = lianJie;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getSocketName() {
		return socketName;
	}
	public void setSocketName(String socketName) {
		this.socketName = socketName;
	}
	public String getLianKey() {
		return lianKey;
	}
	public void setLianKey(String lianKey) {
		this.lianKey = lianKey;
	}
	public void setFunctions(String functions) {
		this.functions = functions;
	}
	public String getVisit_s() {
		return visit_s;
	}
	public void setVisit_s(String visitS) {
		visit_s = visitS;
	}
	public String getMoni_s() {
		return moni_s;
	}
	public void setMoni_s(String moniS) {
		moni_s = moniS;
	}
	public String getDevice_s() {
		return device_s;
	}
	public void setDevice_s(String deviceS) {
		device_s = deviceS;
	}
	public String getFunctionHref(){
		return this.functionHref;
	}
	public void setFunctionHref(String functionHref){
		this.functionHref = functionHref;
	}
	public String getFunctions(){
		return this.functions;
	}
	public void setFunction(String functions){
		this.functions = functions;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getStartTime() {
		return this.startTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getEndTime() {
		return this.endTime;
	}

	public void setCostTime(int costTime) {
		this.costTime = costTime;
	}

	public int getCostTime() {
		return this.costTime;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBelongProject() {
		return belongProject;
	}
	public void setBelongProject(String belongProject) {
		this.belongProject = belongProject;
	}
	public String getSwitchTag() {
		return switchTag;
	}
	public void setSwitchTag(String switchTag) {
		this.switchTag = switchTag;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getLen() {
		return len;
	}
	public void setLen(Integer len) {
		this.len = len;
	}
}
