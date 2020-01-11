<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- saved from url=(0056)http://www.zs-hospital.sh.cn/zsyy/n33/n35/n48/index.html -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>
        财务管理界面
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
        财务报表
    </div>
</div>

<div id="navbar">
    <div class="content unselectable">
        <div class="first">医院</div>
        <div><a href="./index.jsp" title="网站首页">网站首页</a></div>
        <div><a href="" title="财务管理">财务管理</a></div>

    </div>
</div>


<div class="container">
    <h3 style="text-align: center">病床和资金流动情况</h3>
    <div class="clear" style="height: 50px;"></div>
    <form id="form" action="${pageContext.request.contextPath}/deleteSelectServlet" method="post">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th>病历号</th>
                <th>姓名</th>
                <th>原床位</th>
                <th>现床位</th>
                <th>床位更改时间</th>
                <th>原医疗费</th>
                <th>现医疗费</th>
                <th>增加医疗费</th>
                <th>原因</th>
                <th>医疗费更改时间</th>
            </tr>
            <c:forEach items="${pb.list}" var="pt" varStatus="s">
                <tr>
                    <th>${pt.id}</th>
                    <th>${pt.name}</th>
                    <c:if test="${pt.abed != 0}"><th>${pt.abed}</th></c:if>
                    <c:if test="${pt.abed == 0}"><th></th></c:if>

                    <c:if test="${pt.bbed != 0}"><th>${pt.bbed}</th></c:if>
                    <c:if test="${pt.bbed == 0}"><th></th></c:if>
                    <th>${pt.bedtime}</th>
                    <c:if test="${pt.aexpenses != 0}"><th>${pt.aexpenses - pt.bexpenses}</th></c:if>
                    <c:if test="${pt.aexpenses == 0}"><th></th></c:if>

                    <c:if test="${pt.bexpenses != 0}"><th>${pt.aexpenses}</th></c:if>
                    <c:if test="${pt.bexpenses == 0}"><th></th></c:if>

                    <c:if test="${pt.bexpenses != 0}"><th>${pt.bexpenses}</th></c:if>
                    <c:if test="${pt.bexpenses == 0}"><th></th></c:if>

                    <th>${pt.cause}</th>

                    <th>${pt.expensestime}</th>

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
                <a href="${pageContext.request.contextPath}/financialServlet?currentPage=${pb.currentPage}&rows=10" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            </c:if>
            <c:if test="${pb.currentPage != 1}">
                <a href="${pageContext.request.contextPath}/financialServlet?currentPage=${pb.currentPage - 1}&rows=10" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </li>
            </c:if>

            <c:forEach begin="1" end="${pb.totalPage}" var="i">
                <c:if test="${pb.currentPage == i}">
                    <li class="active"><a href="${pageContext.request.contextPath}/financialServlet?currentPage=${i}&rows=10">${i}</a></li>
                </c:if>
                <c:if test="${pb.currentPage != i}">
                    <li><a href="${pageContext.request.contextPath}/financialServlet?currentPage=${i}&rows=10">${i}</a></li>
                </c:if>

            </c:forEach>

            <c:if test="${pb.currentPage == pb.totalPage}">
            <li class="disabled">
                </c:if>
                <c:if test="${pb.currentPage != pb.totalPage}">
            <li>
                </c:if>
                <c:if test="${pb.currentPage == pb.totalPage}">
                <a href="${pageContext.request.contextPath}/financialServlet?currentPage=${pb.currentPage}&rows=10" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            </c:if>
            <c:if test="${pb.currentPage != pb.totalPage}">
                <a href="${pageContext.request.contextPath}/financialServlet?currentPage=${pb.currentPage + 1}&rows=10" aria-label="Next">
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
<div class="clear" style="height: 50px;"></div>
<div class="hr"></div>
<div class="clear" style="height: 50px;"></div>
<h3 style="text-align: center">财务报表</h3>
<div id="chart1" style="width:100%;height:550px;"></div>

<div class="clear" style="height: 50px;"></div>
<div class="hr"></div>
<div class="clear" style="height:50px"></div>

<div>
    <div class="title" style="float: left;margin-left: 70px">资金流向</div>
    <div class="title orange" style="float: right;margin-right: 400px">各科人数统计</div>
</div>
<div class="clear" style="height: 50px;"></div>
<div>
    <div id="chart2" style="width:600px;height:500px;margin-left: 50px;float: left"></div>
    <div id="chart3" style="width:600px;height:500px;float: right"></div>
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
<script type="text/javascript">
    // 初始化图表标签
    var myChart = echarts.init(document.getElementById('chart1'));
    var options={
        //定义一个标题
        title:{
            text:'资金'
        },
        tooltip : {
            trigger: 'axis'
        },

        legend:{
            data:['医疗花费','已收取医疗费']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {show: true, type: ['line', 'bar']},
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        //X轴设置
        xAxis:{
            data:[
                <c:forEach items="${f1}" var="f1">
                '${f1.year}-${f1.month}',
                </c:forEach>
            ]
        },
        yAxis:{
        },
        //name=legend.data的时候才能显示图例
        series:[
            {
            name:'医疗花费',
            type:'bar',
            data:[
                <c:forEach items="${f1}" var="f1">
                '${f1.cost}',
                </c:forEach>
            ]
            },
            {
            name:'已收取医疗费',
            type:'bar',
            data:[
                <c:forEach items="${f1}" var="f1">
                '${f1.collect}',
                </c:forEach>
            ]
            }
        ]


    };
    myChart.setOption(options);
</script>
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
                <c:forEach items="${f2}" var="f2">
                '${f2.department}',
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
            name:'临床科室',
            type:'pie',
            radius:'60%',

            data:[
                <c:forEach items="${f2}" var="f2">
                {value:${f2.deptecost},name:'${f2.department}'},
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
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('chart3'));
    myChart.setOption({


        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:[
                <c:forEach items="${dns}" var="dn">
                '${dn.department}',
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
            name:'临床科室',
            type:'pie',
            radius:'60%',

            data:[
                <c:forEach items="${dns}" var="dn">
                {value:${dn.count},name:'${dn.department}'},
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