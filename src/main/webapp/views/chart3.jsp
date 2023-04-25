<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<style>
  #chart3 > #container3 {
    width: 500px;
    height: 400px;
    /*border: 1px solid darkgray*/
  }
</style>

<script>
  let chart3 = {
    init   : function () {
      /* this를 고정 */
      const self = this;
      self.getData(self)
    },
    getData: function (self) {
      $.ajax({
        url    : '/baseRate',
        success: function (result) {
          console.log(result);
          self.display(result);
        }
      });
    },
    display: function (result) {
      Highcharts.chart('container3', {
        chart: {
          type: 'spline'
        },
        title: {
          text: '한미 기준금리 추이, 2022년'
        },
        subtitle: {
          text: 'Source: ' +
                  '<a href="https://elonbro.tistory.com/entry/%EA%B8%B0%EC%A4%80%EA%B8%88%EB%A6%AC-%ED%95%9C%EA%B5%AD-%EB%AF%B8%EA%B5%AD-%EA%B8%B0%EC%A4%80-%EA%B8%88%EB%A6%AC-%EB%B9%84%EA%B5%90" ' +
                  'target="_blank">한미기준금리차이</a>'
        },
        xAxis: {
          categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
          accessibility: {
            description: 'Months of the year'
          }
        },
        yAxis: {
          title: {
            text: 'Base rate'
          },
          labels: {
            formatter: function () {
              return this.value + '%';
            }
          }
        },
        tooltip: {
          crosshairs: true,
          shared: true
        },
        plotOptions: {
          spline: {
            marker: {
              radius: 4,
              lineColor: '#666666',
              lineWidth: 1
            }
          }
        },
        // series: [{
        //   name: 'Tokyo',
        //   marker: {
        //     symbol: 'square'
        //   },
        //   data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, {
        //     y: 26.4,
        //     marker: {
        //       symbol: 'url(https://www.highcharts.com/samples/graphics/sun.png)'
        //     },
        //     accessibility: {
        //       description: 'Sunny symbol, this is the warmest point in the chart.'
        //     }
        //   }, 22.8, 17.5, 12.1, 7.6]
        //
        // }, {
        //   name: 'Bergen',
        //   marker: {
        //     symbol: 'diamond'
        //   },
        //   data: [{
        //     y: 1.5,
        //     marker: {
        //       symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
        //     },
        //     accessibility: {
        //       description: 'Snowy symbol, this is the coldest point in the chart.'
        //     }
        //   }, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
        // }]
        series : result
      });

    }
  }

  $(function () {
    chart3.init();
  });

</script>

<div id="chart3">
  <div id="container3"></div>
</div>