<%@ page language="java" contentType="text/html;charset=gb2312"%>
<%@ page import="com.godoing.rose.http.common.*"%>
<%@ page import="com.care.common.lang.*"%>
<%@ page import="com.care.common.config.Config"%>
<%@ page import="com.care.app.LoginUser"%>
<%@ taglib uri="/WEB-INF/struts-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic" prefix="logic"%>
<%@ page autoFlush="true"%>
<%
	/*页面属性*/
	PagePys pys = (PagePys) request.getAttribute("PagePys");
	LoginUser loginUser = (LoginUser)request.getSession().getAttribute(Config.SystemConfig.LOGINUSER); 
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>无标题文档</title>
		<link href="<%=request.getContextPath()%>/css/tbls.css"
			rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/public.js"></script>   <!-- 调用此方法 -->
		<script language="JavaScript" src="../../js/jquery-1.8.2.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js"></script>
	</head>
	<script language="javascript">
function finds(){
  /*   var st = new Date(frmGo.startTime.value.replace(/-/g,'/'));
	var et = new Date(frmGo.endTime.value.replace(/-/g,'/'));
	if(Date.parse(st) - Date.parse(et)>0){
		alert("开始时间不能大于结束时间!");
		return false;
	} */
	   frmGo.submit();
}
function add(){
	frmGo.action = "doProjectInfo.do?method=initInsertWatch";
	frmGo.submit();
}
function c(){
    document.all.project_no.value="";
    document.all.project_name.value="";
    
  /*   document.all.userId.options[0].selected=true;
    document.all.projectId.options[0].selected=true; */
} 

function changeCompany(obj){
	$.ajax({
		type:"get",
		url:"doProjectInfo.do?method=getProjectByCompanyId",
		data:"companyId="+obj,
		success:function(msg){
			var projectSelect = document.getElementById("projectId");
			projectSelect.length=1;
			if(msg.trim() != ""){				
				var projects = msg.split("&");
				for(i=0;i<projects.length; i++){
					var project = projects[i].split(",");
					if(project.length == 2){
						projectSelect.options[projectSelect.length] = new Option(project[1],project[0]);
						
					}
					
				}
			}
			
		}
	});
}
function update(id){
	frmGo.action="doProjectInfo.do?method=initUpdateWatch&id="+id;
	frmGo.submit();
}
function updateStatus(id,status){
	frmGo.action="doProjectInfo.do?method=initUpdateWatchStatus&id="+id+"&s="+status;
	frmGo.submit();
}
function deletee(id){
	frmGo.action="doProjectInfo.do?method=deletewatch&id="+id;
	frmGo.submit();
}
function ofuncs(projectId){
	window.open("projectRoleFuncFrame.jsp?projectId=" + i);
	//window.showModalDialog("roleFuncFrame.jsp?roleCode=" + rcode,		"","help:0;resizable:0;status=0;scrollbars=0;dialogWidth=25;dialogHeight=35;center=true");;
}
</script>
	<body>
		<span class="title_1"></span>
		<form name="frmGo" method="post" action="doProjectInfo.do?method=queryWatchInfo">
			
			<table width="100%" class="table" border=0 cellpadding="0" cellspacing="1">
               <tr>
                <th colspan="12" nowrap="nowrap" align="left">
                                               供应商信息
                     <input type="button" class="but_1" accesskey="a"
							tabindex="a" value="添 加" onclick="add()">
                </th>
                </tr>
                 <tr class="title_3">
                        <td colspan="13">
				<%-- 	  创建时间
                     <input name="startTime" type="text" class="txt_1"  id="startTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"fNow_date");%>" onclick="WdatePicker()"
								size="9" readonly> -
							<input name="endTime" type="text" class="txt_1" id="endTime" style="cursor:text"
								value="<%CommUtils.printReqByAtt(request,response,"now_date");%>" onclick="WdatePicker()"
								size="9" readonly>		 --%>				
							公司名称
						    <input id="project_no" name="project_no" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"project_no");%>" size="20">
						     联系人
						    <input id="project_name" name="project_name" type="text" class="txt_1" 
						    value="<%CommUtils.printReqByAtt(request,response,"project_name");%>" size="20">
					<%-- 	项目名		
						<%String projectId = (String)request.getAttribute("projectId"); %>			
							<select id="projectId" name="projectId" >
								<option value="">全部</option>
								<logic:iterate id="pro" name="project">
									<bean:define id="project" name="pro" property="id" type="java.lang.Integer" />																	
									<option value='<%=project %>' <%=String.valueOf(project).equals(projectId)? "selected" : "" %>><bean:write name="pro" property="project_name"/></option>
								</logic:iterate>
							</select>	 --%>						
						<input name="find1" type="button" class="but_1" accesskey="f"
							tabindex="f" value="搜 索" onclick="javascript:finds()">
					     <input name="clear" type="button" class="but_1" accesskey="c"
						    tabindex="c"  value="清除搜索" onclick="c()"> 
				</tr> 
				<%int i=1; %>
                  <tr class="title_2">
                 	 <!-- <td width="10%">
						预览
					</td> -->
					<td width="3%">
						ID
					</td>
					<td width="8%">
						供应商公司名称
					</td>
					<td width="8%">
						联系人
					</td>
					<td width="3%">
						所在地
					</td>					
					
					<td width="6%">
						类型
					</td>
					<td width="6%">
						电话
					</td>
					<td width="6%">
						是否月结
					</td>
					<td width="10%">
						创建时间
					</td>
					<td width="10%">
						备注
					</td>
					<td width="10%">
						操作
					</td>
				</tr>
 
				<logic:iterate id="element" name="pageList">
					<tr class="tr_5" onmouseover='this.className="tr_4"'
						onmouseout='this.className="tr_5"'>
						
						<td>
							<bean:write name="element" property="id" />
						</td>
						
						<%--  <td>
    	                 <img src="<bean:write name="element" property="adDetail"/>"  style="vertical-align:bottom"  width = "150px" height = "150px"></img> 
						</td> --%>
						<td>
						<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="project_no" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="project_no"/></a>		
   						</logic:equal>						
						</td>
						
						<td>		
							<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="project_name" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="project_name"/></a>		
   						</logic:equal>						
						</td>
						
						<td>		
							<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="adTitle" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="adTitle"/></a>		
   						</logic:equal>						
						</td>						
							
						
						<td>
						<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="company_id" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="company_id"/></a>		
   						</logic:equal>	
						</td>
						
						<td>
						<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="channel_id" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="channel_id"/></a>		
   						</logic:equal>	
						</td>
						
						
						<td>
						   <logic:empty name="element" property="socket_way">无</logic:empty>							
							<logic:equal name="element" property="socket_way" value="否"><font color="red">否</font></logic:equal>							
							<logic:equal name="element" property="socket_way" value="是"><font color="green">是</font></logic:equal>
						</td>
						
						
								<%-- <td>
						<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="socket_way" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="socket_way"/></a>		
   						</logic:equal>	
						</td> --%>
					
						
						<td>		
							<logic:equal name="element" property="status" value="0">	
							<a href="#"  style="color:red"><bean:write name="element" property="add_time" format="yyyy-MM-dd HH:mm:ss" /></a>		
						</logic:equal>			
   						<logic:equal name="element" property="status" value="1">	
   							<a href="#"><bean:write name="element" property="add_time" format="yyyy-MM-dd HH:mm:ss"/></a>		
   						</logic:equal>							
						</td>
								
								<td>
							<bean:write name="element" property="remark" />
						</td>
										 						
						<td>
					<%-- 	<a href=# onclick="updateStatus('<bean:write name="element" property="id" />')" style="color:#0000FF" >
						<logic:equal name="element" property="status" value="0">【隐藏】</logic:equal>
						<logic:equal name="element" property="status" value="1">【显示】</logic:equal>
						</a> --%>
						
						<%-- <logic:equal name="element" property="status" value="0">			
   							<a href="#" onclick="updateStatus(<bean:write name='element' property='id'/>,1)" style="color:red">【显示】</a>		
   						</logic:equal>			
   							
   						<logic:equal name="element" property="status" value="1">			
   							<a href="#" style="color:#0000FF"  onclick="updateStatus(<bean:write name='element' property='id'/>,0)">【隐藏】</a>		
   						</logic:equal>	 --%>
   						
							<a href=# onclick="update('<bean:write name="element" property="id" />')" style="color:#0000FF" > 【修改】</a>
							<a href=# onclick="deletee('<bean:write name="element" property="id" />')" style="color:#0000FF" > 【删除】</a>
							<%-- <a href="http://appserver.paby.com:8080/wtpet/images/app/msg/<bean:write name="element" property="photo"/>" title="图片"><img src="http://appserver.paby.com:8080/wtpet/images/app/msg/<bean:write name="element" property="photo"/>" alt="反馈图片" 
							 style="width:400px;height:200px;"/></a> --%>
							<%--  <a href="<bean:write name="element" property="adTitle"/>" title="zip" style="color:#0000FF">【下载zip】</a> --%>
							<%-- <a href="#"
								onclick="ofuncs('<bean:write name="element" property="id" />')"  class="tbl_A" >【权限设置】</a> --%>
						</td>
					</tr>
				</logic:iterate>

			  	<tr class="title_3">
					<td colspan="12" align="left" >  
						<%
							pys.printGoPage(response, "frmGo");
						%>
					</td>
				</tr>  
			</table>
		</form>
	</body>
</html>