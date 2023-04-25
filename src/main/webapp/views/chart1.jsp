<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<style>
    #chart1 > #container {
        width: 700px;
        height: 400px;
        /*border: 1px solid darkgray*/
    }
</style>

<script>
    let chart1 = {
        init   : function () {
            /* this를 고정 */
            const self = this;
            self.getData(self)
        },
        getData: function (self) {
            $.ajax({
                url    : '/app_user_statics',
                success: function (result) {
                    self.display(result);
                }
            });
        },
        display: function (result) {
            Highcharts.chart('container', {
                chart      : {
                    type     : 'column',
                    options3d: {
                        enabled: true,
                        alpha  : 10,
                        beta   : 25,
                        depth  : 70
                    }
                },
                title      : {
                    text : '주요 은행 뱅킹 서비스 관련 앱 11월 사용자 수 현황, 2020',
                    align: 'left'
                },
                subtitle   : {
                    text : 'Source: ' +
                        '<a href="https://platum.kr/archives/154943"' +
                        'target="_blank">아이지에이웍스</a>',
                    align: 'left'
                },
                plotOptions: {
                    column: {
                        depth: 25
                    }
                },
                xAxis      : {
                    categories: result.category,
                    labels    : {
                        skew3d: true,
                        style : {
                            fontSize: '16px'
                        }
                    }
                },
                yAxis      : {
                    title: {
                        text  : '',
                        margin: 20
                    }
                },
                tooltip    : {
                    valueSuffix: ''
                },
                series     : [{
                    name: 'Total users',
                    data: result.data
                }]
            });
        }

    };

    $(function () {
        chart1.init();
    });
</script>

<div id="chart1">
    <div id="container"></div>
</div>