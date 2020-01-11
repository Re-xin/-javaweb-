<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>
        费用明细查询
    </title>
    <meta http-equiv="X-UA-Compatible" content="IE=9">
    <script src="./js/hm.js"></script>
    <script type="text/javascript" src="./js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="./js/jquery.smooth-scroll.min.js"></script>
    <script type="text/javascript" src="./js/unslider.min.js"></script>
    <script type="text/javascript" src="./js/utility.js"></script>
    <link rel="stylesheet" media="screen" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <script src="./js/echarts.js"></script>
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
                        <a href="" >医疗文书校验服务</a>
                    </li>
                    <li>
                        <a href="">导医信息</a>
                    </li>
                    <li>
                        <a href="" >专家门诊</a>
                    </li>
                    <li>
                        <a href="" >普通及专病门诊 </a>
                    </li>
                    <li>
                        <a href="" >门诊出停诊信息查询 </a>
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
                        <a href="" >临床医学杂志编辑部</a>
                    </li>
                </ul>
            </li>

            <li class="has-sub">
                <a href="">医学教育</a>
                <ul>
                    <li>
                        <a href="" >教育处首页</a>
                    </li>
                    <li>
                        <a href="" >本科生教育</a>
                    </li>
                    <li>
                        <a href="" >研究生教育</a>
                    </li>
                    <li>
                        <a href="" >住院医生培养</a>
                    </li>
                    <li>
                        <a href="" >专科医生培养</a>
                    </li>
                    <li>
                        <a href="" >进修教育</a>
                    </li>
                    <li>
                        <a href="" >继续医学教育</a>
                    </li>
                    <li>
                        <a href="" >远程医学</a>
                    </li>
                    <li>
                        <a href="" >教学学术会议</a>
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
                        <a href="" >闽江医院报</a>
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
        费用查询
    </div>
</div>

<div id="navbar">
    <div class="content unselectable">
        <div class="first">医院</div>
        <div><a href="./index.jsp" title="网站首页">网站首页</a></div>
        <div><a href="register.jsp" title="费用查询">费用查询</a></div>

    </div>
</div>

<div class="content unselectable">

    <div style="height:30px"></div>



    <div class="clear" style="height:30px"></div>
    <div class="title" style="margin-left:10px">请输入您的病历号和姓名以查询费用明细</div>


    <div class="clear" style="height:50px"></div>

</div>


<div>
    <form action="/patientSearchServlet" method="post" class="form-inline">
        <div class="form-group">
            <label>病历号</label>
            <input type="text" class="form-control" required value="${pid}" id="name" name="id" placeholder="病历号">
        </div>

        <div class="form-group" style="margin-left: 50px">
            <label>姓名</label>
            <input type="text" class="form-control" required value="${pname}" id="sex" name="name" placeholder="姓名">
        </div>
        <div class="clear" style="height:30px"></div>
        <br>
        <br>
        <button type="submit" class="btn btn-success" href="${pageContext.request.contextPath}/patientSearchServlet">查询</button>
    </form>
    <div class="clear" style="height:50px"></div>
</div>



<c:if test="${ps_msg != null}">
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" >
            <span>&times;</span>
        </button>
        <strong>${ps_msg}</strong>
    </div>
</c:if>



<c:if test="${patient != null}">
    <div class="container">
        <h3 style="text-align: center">查询成功！以下是您的费用明细:</h3>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>病历号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>住院情况</th>
                <th>入院时间</th>
                <th>临床科室</th>
                <th>床位</th>
                <th>押金</th>
                <th>医疗费</th>
                <th>缴费</th>
                <th>操作</th>
            </tr>
            <tr>
                <th>${patient.id}</th>
                <th>${patient.name}</th>
                <th>${patient.sex}</th>
                <th>${patient.age}</th>
                <th>${patient.state}</th>
                <th>${patient.atime}</th>
                <th>${patient.department}</th>
                <th>${patient.bed}</th>
                <th>${patient.deposit}</th>
                <th>${patient.expenses}</th>
                <th>${patient.recharge}</th>
                <td><a class="btn btn-info btn-sm" href="patientrecharge.jsp">充值</a></td>
            </tr>
        </table>
    </div>

    <div id="chart2" style="width:100%;height:400px;"></div>

    <div>
        <div class="alert alert-info" role="alert" style="height: 200px;width: 900px;margin-left: 200px">
            <img src="./imgs/icon_doctor.png" style="float: left;margin-left: 50px">
            <br>
            <br>
            <font style="font-family: 宋体;font-size: 30px">以上是您的信息和费用明细<br>
                <c:if test="${patient.deposit + patient.expenses > patient.recharge}">
                    温馨提示：您的费用不足，请及时充值！
                </c:if>
            </font>
        </div>
    </div>
</c:if>





<div class="clear" style="height:80px"></div>
<div class="clear" style="height:80px"></div>
<div class="clear" style="height:80px"></div>






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
                            <small>&#169; 2019  闽江学院</small>
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
            </span></div>
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
                <small>3177102146   陈智彬</small>
            </div>
            <div>
                <small><a href="" >闽ICP备05005466号 </a>　
                    <a ><img src="./imgs/ba.png"> 闽公网安备 35012102500037号 </a></small>
            </div>
        </div>
        <div class="right">
            <div>
                <div><b>友情链接</b></div>
                <div><a href="" >闽江学院主站</a></div>
                <div><a href="" >闽江学院高考分数线_招生信息</a></div>

                <div><a href="" >闽江学院教务管理系统</a></div>
                <div><a href="" >闽江学院招生办</a></div>
                <div><a href="" >闽江学院图书馆</a></div>
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
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('chart2'));
    myChart.setOption({


        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:[
                '押金',
                <c:forEach items="${list}" var="pc">
                '${pc.cause}',
                </c:forEach>
            ]
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series:[{
            name:'项目',
            type:'pie',
            radius:'70%',

            data:[
                {value:${patient.deposit},name:'押金'},
                <c:forEach items="${list}" var="pc">
                {value:${pc.expenses},name:'${pc.cause}'},
                </c:forEach>
            ],
            itemStyle:{
                normal:{
                    label:{
                        show: true,
                        formatter: '{b} : {c} ({d}%)'
                    },
                    labelLine :{show:true}
                }
            }
        }]
    })

</script>
</html>