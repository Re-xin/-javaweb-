<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<!-- saved from url=(0056)http://www.zs-hospital.sh.cn/zsyy/n33/n35/n48/v -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>
        患者管理界面
    </title>
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <script src="./js/hm.js"></script>
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./js/jquery.smooth-scroll.min.js"></script>
    <script type="text/javascript" src="./js/unslider.min.js"></script>
    <script type="text/javascript" src="./js/utility.js"></script>
    <link rel="stylesheet" media="screen" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script type="text/javascript">
        function onSearchSubmit() {
            var txtKey = $("#txtKey").val();
            window.location.href = "" + txtKey;
        }

        function nameonFocus(name, id) {
            var x = document.getElementById(id);
            if (x.value == name) {
                x.value = '';
                x.style.textAlign = 'left';
                x.style.color = '#666';
            }

        }

        function nameonFocusout(name, id) {
            var x = document.getElementById(id);
            if (x.value == '') {
                x.value = name;
                x.style.textAlign = 'left';
                x.style.color = '#aaa';
            }

        }

        function nameonBlur(name, id) {
            var x = document.getElementById(id);
            if (x.value == '') {
                x.value = name;
                x.style.textAlign = 'left';
                x.style.color = '#666';
            }
        }
        window.onload = function(){
            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("pid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;
                }
            }
        }
    </script>
    <script>

        function  deletePatient(id) {
            if(confirm("您确定要删除嘛？")){
                location.href="${pageContext.request.contextPath}/deletePatientServlet?id="+id;
            }
        }


        window.onload = function () {
            document.getElementById("delSelected").onclick = function () {
                if(confirm("您确定要删除选中条目嘛？")){
                    var flag = false;
                    var cbs = document.getElementsByName("pid");
                    for (var i = 0; i < cbs.length; i++) {
                        if(cbs[i].checked){
                            flag = true;
                            break;
                        }
                    }

                    if(flag == true){
                        document.getElementById("form").submit();
                    }



                }

            }

            //1.获取第一个cb
            document.getElementById("firstCb").onclick = function(){
                //2.获取下边列表中所有的cb
                var cbs = document.getElementsByName("pid");
                //3.遍历
                for (var i = 0; i < cbs.length; i++) {
                    //4.设置这些cbs[i]的checked状态 = firstCb.checked
                    cbs[i].checked = this.checked;

                }

            }


        }

    </script>
    <script>
        $(function () {
            if (${loginDoctor == null }){
                $("#login").css("display","block");
            }else {
                $("#welcome").css("display","block");
            }

        })
    </script>
</head>
<body>

<script type="text/javascript" src="./imgs/index.js"></script>
<div id="top">
    <div class="content" >
        <img src="imgs/logo.png" height="150px" width="560px">
        <div class="right">
            <div class="links" id="login" style="display: none">
                　<a href="login.jsp">登入</a>
                　<a href="/doctorregister.jsp">注册</a>
            </div>
            <div class="links" id="welcome" style="display: none">
                欢迎您${loginDoctor.name}医生&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="/loginOutServlet">退出</a>
            </div>
            <div id="search">
                <form method="post"  id="ctl00">
                    <input id="txtKey" name="q" class="input" type="text"  maxlength="15"
                           onfocus="formValue.cd(this)" onblur="formValue.rd(this)">
                    <input class="go" type="submit" value="">
                </form>
            </div>
        </div>
    </div>
</div>


<div id="menu">
    <div id="nav" role="navigation">
        <ul>

            <li>
                <a href="">网站首页</a>
            </li>

            <li class="has-sub">
                <a href="">就医入口</a>
                <ul>
                    <li>
                        <a href="">预约挂号</a>
                    </li>
                    <li>
                        <a href="">健康管理中心</a>
                    </li>
                    <li>
                        <a href="">医疗文书校验服务</a>
                    </li>
                    <li>
                        <a href="">导医信息</a>
                    </li>
                    <li>
                        <a href="">专家门诊</a>
                    </li>
                    <li>
                        <a href="">普通及专病门诊 </a>
                    </li>
                    <li>
                        <a href="">门诊出停诊信息查询 </a>
                    </li>
                    <li>
                        <a href="">交通指南</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">学科及专家</a>
                <ul>
                    <li>
                        <a href="">学科及专家介绍</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">科学研究</a>
                <ul>
                    <li>
                        <a href="">科研处</a>
                    </li>
                    <li>
                        <a href="">科研信息</a>
                    </li>
                    <li>
                        <a href="">临床医学研究院</a>
                    </li>
                    <li>
                        <a href="">临床医学杂志编辑部</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">医学教育</a>
                <ul>
                    <li>
                        <a href="">教育处首页</a>
                    </li>
                    <li>
                        <a href="">本科生教育</a>
                    </li>
                    <li>
                        <a href="">研究生教育</a>
                    </li>
                    <li>
                        <a href="">住院医生培养</a>
                    </li>
                    <li>
                        <a href="">专科医生培养</a>
                    </li>
                    <li>
                        <a href="">进修教育</a>
                    </li>
                    <li>
                        <a href="">继续医学教育</a>
                    </li>
                    <li>
                        <a href="">远程医学</a>
                    </li>
                    <li>
                        <a href="">教学学术会议</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="">人才招聘</a>
            </li>

            <li class="has-sub">
                <a href="">医院信息</a>
                <ul>
                    <li>
                        <a href="">办公管理平台</a>
                    </li>
                    <li>
                        <a href="">新OA系统</a>
                    </li>
                    <li>
                        <a href="">闽江医院报</a>
                    </li>
                    <li>
                        <a href="">院史考据</a>
                    </li>
                    <li>
                        <a href="">医院手机App(安卓版)</a>
                    </li>
                    <li>
                        <a href="">医院手机App下载</a>
                    </li>
                    <li>
                        <a href="">媒体视点</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>


<div id="sub-head">
    <div class="sub-title unselectable">
        患者管理
    </div>
</div>

<div id="navbar">
    <div class="content unselectable">
        <div class="first">医院</div>
        <div><a href="./index.jsp" title="网站首页">网站首页</a></div>
        <div><a href="${request.getContextPath()}/findPatientByPageServlet" title="患者管理">患者管理</a></div>

    </div>
</div>


<div class="container">
    <h3 style="text-align: center">患者信息列表</h3>
    <div class="clear" style="height: 20px"></div>
    <div style="float: left;background-color:rgba(204,255,193,0.45);width: 1150px;border-radius:20px;">

        <form class="form-inline" style="margin-right: 30px" action="${pageContext.request.contextPath}/findPatientByPageServlet" method="post">
            <div style="margin-top: 20px">
                <div class="form-group" >
                    <label for="exampleInputName2">病历号:</label>
                    <input type="text"style="width: 80px;" value="${condition.id[0]}" name="id"  class="form-control" id="exampleInputName2" >
                </div>
                <div class="form-group">
                    <label >姓名:</label>
                    <input type="text"style="width: 80px" value="${condition.name[0]}"  name="name"  class="form-control"  >
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">性别:</label>
                    <input type="text"style="width: 80px"  value="${condition.sex[0]}" name="sex"  class="form-control" id="exampleInputEmail2"  >
                </div>

                <div class="form-group">
                    <label >状态</label>
                    <input type="text" style="width: 120px"  value="${condition.state[0]}" name="state"  class="form-control" >
                </div>
                <div class="form-group">
                    <label>入院时间</label>
                    <input type="text" style="width: 120px"  value="${condition.atime[0]}" name="atime"  class="form-control" >
                </div>
                <div class="form-group">
                    <label >临床科室</label>
                    <input type="text" style="width: 80px"  value="${condition.department[0]}" name="department"  class="form-control"  >
                </div>
                <div class="form-group">
                    <label>床位</label>
                    <input type="text" style="width: 80px"  value="${condition.bed[0]}" name="bed"  class="form-control"  >
                </div>
            </div>
            <div class="clear" style="height: 20px"></div>
            <div style="margin-left: 10px">
                <div class="form-group">
                    <label >年龄:</label>
                    <input type="text" style="width: 80px" value="${condition.age1[0]}"  name="age1"  class="form-control"  >
                </div>
                <div class="form-group" style="margin-right: 40px">
                    <label >至</label>
                    <input type="text" style="width: 80px"  value="${condition.age2[0]}" name="age2"  class="form-control"  >
                </div>
                <div class="form-group">
                    <label >押金</label>
                    <input type="text" style="width: 80px"  value="${condition.deposit1[0]}" name="deposit1"  class="form-control"  >
                </div>
                <div class="form-group"style="margin-right: 40px">
                    <label >至</label>
                    <input type="text" style="width: 80px"  value="${condition.deposit2[0]}" name="deposit2"  class="form-control"  >
                </div>
                <div class="form-group">
                    <label >医疗费</label>
                    <input type="text" style="width: 80px"  value="${condition.expenses1[0]}" name="expenses1"  class="form-control"  >
                </div>
                <div class="form-group"style="margin-right: 40px">
                    <label >至</label>
                    <input type="text" style="width: 80px"  value="${condition.expenses2[0]}" name="expenses2"  class="form-control"  >
                </div>
                <div class="form-group">
                    <label >缴费</label>
                    <input type="text" style="width: 80px"  value="${condition.recharge1[0]}" name="recharge1"  class="form-control"  >
                </div>
                <div class="form-group"style="margin-right: 40px">
                    <label>至</label>
                    <input type="text" style="width: 80px"  value="${condition.recharge2[0]}" name="recharge2"  class="form-control"  >
                </div>
            </div>
            <div class="clear" style="height: 20px"></div>
            <span class="glyphicon glyphicon-exclamation-sign" style="color: #ff5a47;position: absolute;margin: 610px -550px"> 此患者10天以上未缴完费用</span>
            <span class="glyphicon glyphicon-exclamation-sign" style="color: #ffe93a;position: absolute;margin: 610px -340px"> 此患者未缴完费用</span>
            <button type="submit" class="btn btn-primary" style="position: absolute;margin:5px 420px">查询</button>
        </form>

    </div>


    <div style="float: right;margin: 5px;">
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/deleteSelectServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th><input type="checkbox" id="firstCb"></th>
            <th>病历号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话号码</th>
            <th>状态</th>
            <th>入院时间</th>
            <th>临床科室</th>
            <th>床位</th>
            <th>押金</th>
            <th>医疗费</th>
            <th>缴费</th>
            <th>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp操作</th>
        </tr>
        <c:forEach items="${pb.list}" var="pt" varStatus="s">
            <tr>
                <td><input type="checkbox" name="pid" value="${pt.id}"></td>
                <th>${pt.id}</th>
                <th>${pt.name}</th>
                <th>${pt.sex}</th>
                <c:if test="${pt.age!=0}"><th>${pt.age}</th></c:if>
                <c:if test="${pt.age==0}"><th></th></c:if>
                <th>${pt.del}</th>
                <th>${pt.state}</th>

                <th>${pt.atime}<c:if test="${a_state != pt.state}"><c:if test="${pt.deposit + pt.expenses > pt.recharge}"><c:if test="${str > pt.atime}">&nbsp;&nbsp;<span class="glyphicon glyphicon-exclamation-sign" style="color: #ff5a47"></span></c:if></c:if></c:if></th>

                <th>${pt.department}</th>
                <c:if test="${pt.bed!=0}"><th>${pt.bed}</th></c:if>
                <c:if test="${pt.bed==0}"><th></th></c:if>
                <c:if test="${pt.deposit!=0}"><th>${pt.deposit}</th></c:if>
                <c:if test="${pt.deposit==0}"><th></th></c:if>
                <c:if test="${pt.expenses!=0}"><th>${pt.expenses}</th></c:if>
                <c:if test="${pt.expenses==0}"><th></th></c:if>
                <c:if test="${pt.recharge!=0}"><th>${pt.recharge}&nbsp;&nbsp;<c:if test="${a_state != pt.state}"><c:if test="${pt.deposit + pt.expenses > pt.recharge}"><span class="glyphicon glyphicon-exclamation-sign" style="color: #ffe93a"></span></c:if></c:if></th></c:if>
                <c:if test="${pt.recharge==0}"><th><c:if test="${a_state != pt.state}"><c:if test="${pt.deposit + pt.expenses > pt.recharge}"><span class="glyphicon glyphicon-exclamation-sign" style="color: #ffe93a"></span></c:if></c:if></th></c:if>

                <td>
                    <c:if test="${a_state != pt.state}">
                        <c:if test="${pt.bed==0}"><a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/findPatientServlet?id=${pt.id}&mark=1">审核</a></c:if>
                        <c:if test="${pt.bed!=0}"><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/findPatientServlet?id=${pt.id}&mark=2">操作</a></c:if>
                    </c:if>
                    &nbsp;
                    <a class="btn btn-default btn-sm" href="javascript:deletePatient(${pt.id});">删除</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </form>
</div>

<div style="float: left;margin-left: 62px">
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${pb.currentPage == 1}">
                <li class="disabled">
                    </c:if>
                    <c:if test="${pb.currentPage != 1}">
                <li>
                    </c:if>
                    <c:if test="${pb.currentPage == 1}">
                    <a href="${pageContext.request.contextPath}/findPatientByPageServlet?currentPage=${pb.currentPage}&rows=10&id=${condition.id[0]}&name=${condition.name[0]}&sex=${condition.sex[0]}&state=${condition.state[0]}&atime=${condition.atime[0]}&department=${condition.department[0]}&bed=${condition.bed[0]}&age1=${condition.age1[0]}&age2=${condition.age2[0]}&deposit1=${condition.deposit1[0]}&deposit2=${condition.deposit2[0]}&expenses1=${condition.expenses1[0]}&expenses2=${condition.expenses2[0]}&recharge1=${condition.recharge1[0]}&recharge2=${condition.recharge2[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                </c:if>
                <c:if test="${pb.currentPage != 1}">
                    <a href="${pageContext.request.contextPath}/findPatientByPageServlet?currentPage=${pb.currentPage - 1}&rows=10&id=${condition.id[0]}&name=${condition.name[0]}&sex=${condition.sex[0]}&state=${condition.state[0]}&atime=${condition.atime[0]}&department=${condition.department[0]}&bed=${condition.bed[0]}&age1=${condition.age1[0]}&age2=${condition.age2[0]}&deposit1=${condition.deposit1[0]}&deposit2=${condition.deposit2[0]}&expenses1=${condition.expenses1[0]}&expenses2=${condition.expenses2[0]}&recharge1=${condition.recharge1[0]}&recharge2=${condition.recharge2[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                </c:if>

            <c:forEach begin="1" end="${pb.totalPage}" var="i">
                <c:if test="${pb.currentPage == i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/findPatientByPageServlet?currentPage=${i}&rows=10&id=${condition.id[0]}&name=${condition.name[0]}&sex=${condition.sex[0]}&state=${condition.state[0]}&atime=${condition.atime[0]}&department=${condition.department[0]}&bed=${condition.bed[0]}&age1=${condition.age1[0]}&age2=${condition.age2[0]}&deposit1=${condition.deposit1[0]}&deposit2=${condition.deposit2[0]}&expenses1=${condition.expenses1[0]}&expenses2=${condition.expenses2[0]}&recharge1=${condition.recharge1[0]}&recharge2=${condition.recharge2[0]}">${i}</a></li>
                </c:if>
                <c:if test="${pb.currentPage != i}">
                    <li><a href="${pageContext.request.contextPath}/findPatientByPageServlet?currentPage=${i}&rows=10&id=${condition.id[0]}&name=${condition.name[0]}&sex=${condition.sex[0]}&state=${condition.state[0]}&atime=${condition.atime[0]}&department=${condition.department[0]}&bed=${condition.bed[0]}&age1=${condition.age1[0]}&age2=${condition.age2[0]}&deposit1=${condition.deposit1[0]}&deposit2=${condition.deposit2[0]}&expenses1=${condition.expenses1[0]}&expenses2=${condition.expenses2[0]}&recharge1=${condition.recharge1[0]}&recharge2=${condition.recharge2[0]}">${i}</a></li>
                </c:if>

            </c:forEach>

            <c:if test="${pb.currentPage == pb.totalPage}">
                <li class="disabled">
            </c:if>
            <c:if test="${pb.currentPage != pb.totalPage}">
                <li>
            </c:if>
                <c:if test="${pb.currentPage == pb.totalPage}">
                <a href="${pageContext.request.contextPath}/findPatientByPageServlet?currentPage=${pb.currentPage}&rows=10&id=${condition.id[0]}&name=${condition.name[0]}&sex=${condition.sex[0]}&state=${condition.state[0]}&atime=${condition.atime[0]}&department=${condition.department[0]}&bed=${condition.bed[0]}&age1=${condition.age1[0]}&age2=${condition.age2[0]}&deposit1=${condition.deposit1[0]}&deposit2=${condition.deposit2[0]}&expenses1=${condition.expenses1[0]}&expenses2=${condition.expenses2[0]}&recharge1=${condition.recharge1[0]}&recharge2=${condition.recharge2[0]}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
                </c:if>
                <c:if test="${pb.currentPage != pb.totalPage}">
                <a href="${pageContext.request.contextPath}/findPatientByPageServlet?currentPage=${pb.currentPage + 1}&rows=10&id=${condition.id[0]}&name=${condition.name[0]}&sex=${condition.sex[0]}&state=${condition.state[0]}&atime=${condition.atime[0]}&department=${condition.department[0]}&bed=${condition.bed[0]}&age1=${condition.age1[0]}&age2=${condition.age2[0]}&deposit1=${condition.deposit1[0]}&deposit2=${condition.deposit2[0]}&expenses1=${condition.expenses1[0]}&expenses2=${condition.expenses2[0]}&recharge1=${condition.recharge1[0]}&recharge2=${condition.recharge2[0]}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </li>
                </c:if>

            <span style="font-size: 25px;margin-left: 5px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
            </span>
        </ul>
    </nav>
</div>

<div class="clear" style="height:50px"></div>

<script type="text/javascript" src="./imgs/index(1).js"></script>

<div id="footer" style="height:225px;">
    <div class="content unselectable">
        <div class="left" style="width:390px">
            <table>
                <tbody>
                <tr>
                    <td colspan="2" height="10"></td>
                </tr>
                <tr>
                    <td width="60"><img src="./imgs/logo_bottom.png"></td>
                    <td>
                        <div>
                            <small>&#169; 2019 闽江学院</small>
                        </div>
                        <div style="height:5px"></div>
                        <div><a href="" target="_blank">人大代表信箱</a>　|　<a
                                href="">行风监督信箱</a></div>
                    </td>
                    <td width="80">
                        <div style="width:80px;height:60px;margin-top:-20px;">
            <span id="aaaa"><a
                    href=""
                    target="_blank">
              <img id="imgConac" vspace="0" hspace="0" border="0" src="./imgs/blue.png" data-bd-imgshare-binded="1"></a>
            </span>
                            <script src="./imgs/CA020000000609260600003.js" type="text/javascript"></script>
                            <span id="bbbb"></span></div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div style="height:10px"></div>
            <div>
                <small>地址：福建省福州市闽侯县上街镇溪源宫路200号　|　邮编：350108</small>
            </div>
            <div>
                <small>电话：233-3333333333</small>
            </div>
            <div>
                <small>3177102146 陈智彬</small>
            </div>
            <div>
                <small><a href="">闽ICP备05005466号 </a>　
                    <a><img src="./imgs/ba.png"> 闽公网安备 35012102500037号 </a></small>
            </div>
        </div>
        <div class="right">
            <div>
                <div><b>友情链接</b></div>
                <div><a href="">闽江学院主站</a></div>
                <div><a href="">闽江学院高考分数线_招生信息</a></div>

                <div><a href="">闽江学院教务管理系统</a></div>
                <div><a href="">闽江学院招生办</a></div>
                <div><a href="">闽江学院图书馆</a></div>
            </div>
            <div>
                <div><b>&nbsp;</b></div>
                <div><a href="">福建省立医院</a></div>
                <div><a href="">福建医科大学第一附属医院</a></div>
                <div><a href="">福建协和医院</a></div>
                <div><a href="">福建中医药大学附属人民医院</a></div>
            </div>
        </div>
    </div>
</div>


</body>
</html>