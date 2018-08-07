<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.WMAttend"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[pizzaShop]勤怠管理</title>
        <jsp:include page="/WEB-INF/view/common/admin/include.jsp" flush="true" />
        <link rel="stylesheet" href="/pizzaShop/css/WMstyle.css">
<script type="text/javascript" src="/pizzaShop/js/WMscript.js"></script>
<script>
<%
WMAttend attend = (WMAttend) request.getAttribute("attend");
int countnum = attend.getAttend().length;

out.print("window.onload = function() {");
out.print("var elements = document.getElementsByTagName('input');");
	for(int i = 0; i < countnum; i++) {
		out.print("for(var j = 0; j < document.form.checkbox.length; j++) {");
			out.print("if(document.form.checkbox[j].value == '" + attend.getAttend()[i] + "') {");
			out.print("elements[j].setAttribute('checked', '');");
			out.print("}");
		out.print("}");
	}
out.print("}");

out.print("");
%>
</script>

</head>

<body>
        <!--ここからヘッダー-->
        <jsp:include page="/WEB-INF/view/common/admin/header.jsp" flush="true" />
        <!--ヘッダここまでー-->

        <!--ここからwrapperー-->
        <div id="wrapper" class="clearfix">
            <!--ここからメイン-->
            <div id="main">




 <!--チームの皆さん、ここから自身の担当している画面を作成してください。-->
 <!--見出しにh2タグ、本文にpタグを利用しますとCSSが適用されますのでお勧めです。-->





<h2>勤怠登録</h2><br>

<p>勤務日にチェックを入れて登録ボタンを押してください<br>
修正する場合は全削除ボタンを押してチェックを入れ直してください</p>

<form name="form" method="POST" action="/pizzaShop/WMRegistServlet" onsubmit="return myCheck()">
<div class="calender">
<%
String[] names = new String[]{"新井　大輔","飯田　純平","小川百合香","中野　敬太","松田　拓也","和田　昌大"};//名前をセット

Calendar cal = Calendar.getInstance();//カレンダーオブジェクトを生成

for(int month = 1; month < 13; month++) {//	月
	out.print("<table id=table" + month + "><tr><th>" + month +"月</th>");

	for(int i = 0; i < names.length; i++) {//名前
		out.print("<th>" + names[i] + "</th>");
	}
	out.print("</tr>");

	for(int day = 1; day < 32; day++) {//日
		out.print("<tr>");
		out.print("<th>" + month + "/" + day + "</th>");
		for(int i = 0; i < names.length; i++) {//人数分のチェックボックス
			out.print("<td onclick=getElementById('" + (i + 1) + month + day + "').click();>");
			out.print("<input type=checkbox name=checkbox id=" + (i + 1) + month + day);
			out.print(" value=" + (i + 1)  + "："  + cal.get(Calendar.YEAR) + "-" + month + "-" + day + " onclick=this.click()>");
			out.print("</td>");
		}
		out.print("</tr>");

		if(month == 2 && day == 28) {
			break;
		}
		if(month == 4 && day == 30) {
			break;
		}
		if(month == 6 && day == 30) {
			break;
		}
		if(month == 9 && day == 30) {
			break;
		}
		if(month == 11 && day == 30) {
			break;
		}
	}
	out.print("</table><br>");
}
%>

</div>
<div id="sidearea">
	<table>
	<tr>
	<td><a href="#table1">1月</a></td>
	<td><a href="#table7">7月</a></td>
	</tr>
	<tr>
	<td><a href="#table2">2月</a></td>
	<td><a href="#table8">8月</a></td>
	</tr>
	<tr>
	<td><a href="#table3">3月</a></td>
	<td><a href="#table9">9月</a></td>
	</tr>
	<tr>
	<td><a href="#table4">4月</a></td>
	<td><a href="#table10">10月</a></td>
	</tr>
	<tr>
	<td><a href="#table5">5月</a></td>
	<td><a href="#table11">11月</a></td>
	</tr>
	<tr>
	<td><a href="#table6">6月</a></td>
	<td><a href="#table12">12月</a></td>
	</tr>
	</table>

	<input type=submit value=登録>
</form>
<form method="GET" action="/pizzaShop/WMRegistServlet" ><br><br>
	<input type=submit value=全削除>
</form>
</div>

<!--作業領域はここまでです。-->




            </div>
            <!--メインここまで-->
            <!--ここからサイド-->
            <!--サイドここまで-->
        </div>
        <!--wrapperここまで-->

        <!--ここからフッター-->
        <jsp:include page="/WEB-INF/view/common/admin/footer.jsp" flush="true" />
        <!--フッターここまで-->
    </body>
</html>
