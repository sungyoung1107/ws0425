<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<style>
    #chart2 > #container2 {
        width: 300px;
        height: 250px;
        /*border: 1px solid darkgray*/
    }
</style>

<script>
    let chart2 = {
        init   : function () {
            /* this를 고정 */
            const self = this;
            self.getData(self)
        },
        getData: function (self) {
            $.ajax({
              url: '/app_user_age',
              success: function(result){
                  // console.log(result);
                  self.display(result);
              }
            });
        },
        display: function (result) {
            Highcharts.chart('container2', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: '뱅킹 앱 사용자 연령별 통계, 2020',
                    align: 'left'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                accessibility: {
                    point: {
                        valueSuffix: '%'
                    }
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                        }
                    }
                },
                series: [{
                    name: 'Age',
                    colorByPoint: true,
                    // data: [{
                    //     name: 'Chrome',
                    //     y: 70.67,
                    // }, {
                    //     name: 'Edge',
                    //     y: 14.77
                    // }]
                    data : result
                }]
            });
        }

    };

    $(function () {
        chart2.init();
    });

</script>

<div id="chart2">
    <div id="container2"></div>
</div>