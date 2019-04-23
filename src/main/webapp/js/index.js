    var chartwidth = 1000;
    $(".sidebar-dropdown > a").click(function() {
      $(".sidebar-submenu").slideUp(200);
      if (
        $(this)
          .parent()
          .hasClass("active")
      ) {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .parent()
          .removeClass("active");
      } else {
        $(".sidebar-dropdown").removeClass("active");
        $(this)
          .next(".sidebar-submenu")
          .slideDown(200);
        $(this)
          .parent()
          .addClass("active");
      }
    });

    $("#close-sidebar").click(function() {
      $(".page-wrapper").removeClass("toggled");
      chartwidth = $('#calendar_chart').width();
      console.log(chartwidth);
    });
    $("#show-sidebar").click(function() {
      $(".page-wrapper").addClass("toggled");
    });
    var ctx = document.getElementById("myChart1").getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['#1', '#2', '#3', '#4', '#5', '#6','#7','#8','#9','#10','#1', '#2', '#3', '#4', '#5', '#6','#7','#8','#9','#10'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3,12, 19, 3, 5,12, 19, 3, 5, 2, 3,12, 19, 3, 5],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)',
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
          title: {
                display: true,
                text: 'Test Case wise Bugs'
              },
              tooltips: {
                mode: 'index',
                intersect: false
              },
              responsive: true,
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero:true
                    }
                }]
            }
        }
    });

        var barChartData = {
          labels: ['#1', '#2', '#3', '#4', '#5', '#6','#7','#8','#9','#10','#1', '#2', '#3', '#4', '#5', '#6','#7','#8','#9','#10'],
          datasets: [{
            label: 'Passed',
            backgroundColor: 'rgba(72, 143, 49, 0.49)',
            data: [12, 19, 3, 5, 2, 3,12, 19, 3, 5,12, 19, 3, 5, 2, 3,12, 19, 3, 5]
          }, {
            label: 'Failed',
            backgroundColor: 'rgba(222, 66, 91, 0.8)',
            data: [12, 19, 3, 5, 2, 3,12, 19, 3, 5,12, 19, 3, 5, 2, 3,12, 19, 3, 5]
          }, {
            label: 'Skipped',
            backgroundColor: '#f3c8c9',
            data: [12, 19, 3, 5, 2, 3,12, 19, 3, 5,12, 19, 3, 5, 2, 3,12, 19, 3, 5]
          }]

        };
        window.onload = function() {
          var ctx = document.getElementById('myChart').getContext('2d');
          window.myBar = new Chart(ctx, {
            type: 'bar',
            data: barChartData,
            options: {
              title: {
                display: true,
                text: 'Test Case wise Performance'
              },
              tooltips: {
                mode: 'index',
                intersect: false
              },
              responsive: true,
              scales: {
                xAxes: [{
                  stacked: true,
                }],
                yAxes: [{
                  stacked: true
                }]
              }
            }
          });
        };
        window.onload = function() {
          var ctx = document.getElementById('myChart').getContext('2d');
          window.myBar = new Chart(ctx, {
            type: 'bar',
            data: barChartData,
            options: {
              title: {
                display: true,
                text: 'Test Case wise Performance'
              },
              tooltips: {
                mode: 'index',
                intersect: false
              },
              responsive: true,
              scales: {
                xAxes: [{
                  stacked: true,
                }],
                yAxes: [{
                  stacked: true
                }]
              }
            }
          });
        };
        new Chart(document.getElementById("myChart13"),{"type":"doughnut","data":{"labels":["Red","Blue","Yellow"],"datasets":[{"label":"My First Dataset","data":[300,50,100],"backgroundColor":["rgb(255, 99, 132)","rgb(54, 162, 235)","rgb(255, 205, 86)"]}]}});
        new Chart(document.getElementById("myChart2"),{"type":"doughnut","data":{"labels":["Red","Blue","Yellow"],"datasets":[{"label":"My First Dataset","data":[300,50,100],"backgroundColor":["rgb(255, 99, 132)","rgb(54, 162, 235)","rgb(255, 205, 86)"]}]}});
  //label=testcase x=expectedtime y=stepnumber*5 r=actualtime
        new Chart(document.getElementById("bubble-chart"),{"type":"bubble","data":{"datasets":[
          {"label":"#1","data":[{"x":25,"y":30,"r":15},{"x":40,"y":14,"r":10},{"x":20,"y":30,"r":15},{"x":40,"y":10,"r":3},],"backgroundColor":"rgba(255, 99, 132, 0.2)","borderColor":"rgba(255,99,132,1)"},
          {"label":"#2","data":[{"x":29,"y":30,"r":15},{"x":20,"y":10,"r":10},{"x":20,"y":35,"r":15},{"x":23,"y":10,"r":1},],"backgroundColor":"rgba(54, 162, 235, 0.2)","borderColor":"rgba(54, 162, 235, 1)"},
          {"label":"#3","data":[{"x":60,"y":36,"r":10},{"x":40,"y":13,"r":10},{"x":50,"y":10,"r":15},{"x":48,"y":54,"r":12},],"backgroundColor":"rgba(255, 206, 86, 0.2)","borderColor":"rgba(255, 206, 86, 1)"},
          {"label":"#4","data":[{"x":20,"y":30,"r":15},{"x":40,"y":10,"r":10},{"x":20,"y":30,"r":15},{"x":40,"y":10,"r":21},],"backgroundColor":"rgba(75, 192, 192, 0.2","borderColor":"rgba(75, 192, 192, 1)"},
          {"label":"#5","data":[{"x":11,"y":38,"r":15},{"x":44,"y":10,"r":10},{"x":20,"y":33,"r":15},{"x":20,"y":10,"r":20},],"backgroundColor":"rgba(153, 102, 255, 0.2)","borderColor":"rgba(153, 102, 255, 1)"},
          ]}});

  new Chart(document.getElementById("failed_charts"),{"type":"line","data":{"labels":["January","February","March","April","May","June","July"],"datasets":[{"label":"My First Dataset","data":[65,59,80,81,56,55,40],"fill":false,"borderColor":"rgb(75, 192, 192)","lineTension":0.1}]},"options":{}});
  new Chart(document.getElementById("tc_execution_time"),{"type":"horizontalBar","data":{"labels":["January","February","March","April","May","June","July"],"datasets":[{"label":"My First Dataset","data":[65,59,80,81,56,55,40],"fill":false,"backgroundColor":["rgba(255, 99, 132, 0.2)","rgba(255, 159, 64, 0.2)","rgba(255, 205, 86, 0.2)","rgba(75, 192, 192, 0.2)","rgba(54, 162, 235, 0.2)","rgba(153, 102, 255, 0.2)","rgba(201, 203, 207, 0.2)"],"borderColor":["rgb(255, 99, 132)","rgb(255, 159, 64)","rgb(255, 205, 86)","rgb(75, 192, 192)","rgb(54, 162, 235)","rgb(153, 102, 255)","rgb(201, 203, 207)"],"borderWidth":1}]},"options":{"scales":{"yAxes":[{"ticks":{"beginAtZero":true}}]}}});
    google.charts.load("current", {packages:["calendar"]});
          google.charts.setOnLoadCallback(drawChart);

       function drawChart() {
           var dataTable = new google.visualization.DataTable();
           dataTable.addColumn({ type: 'date', id: 'Date' });
           dataTable.addColumn({ type: 'number', id: 'Won/Loss' });
           dataTable.addRows([
              [ new Date(2018, 3, 13), 37032 ],
              [ new Date(2018, 3, 14), 38024 ],
              [ new Date(2018, 3, 15), 38024 ],
              [ new Date(2018, 3, 16), 38108 ],
              [ new Date(2018, 3, 13), 37032 ],
              [ new Date(2018, 3, 14), 38024 ],
              [ new Date(2018, 9, 15), 38024 ],
              [ new Date(2018, 5, 16), 38108 ],
              [ new Date(2018, 3, 13), 37032 ],
              [ new Date(2018, 4, 14), 38024 ],
              [ new Date(2018, 4, 15), 38024 ],
              [ new Date(2018, 3, 16), 38108 ],
              [ new Date(2018, 4, 13), 37032 ],
              [ new Date(2018, 2, 14), 38024 ],
              [ new Date(2018, 1, 15), 38024 ],
              [ new Date(2018, 6, 16), 38108 ],
              [ new Date(2018, 9, 13), 37032 ],
              [ new Date(2018, 9, 14), 38024 ],
              [ new Date(2018, 8, 15), 38024 ],
              [ new Date(2018, 7, 16), 38108 ],
              [ new Date(2018, 8, 17), 38229 ]
            ]);

           var chart = new google.visualization.Calendar(document.getElementById('calendar_basic'));
           var chartheight = $('#calendar_chart').height();
           console.log(chartheight);
           var cell_size = chartwidth/72;
           console.log(cell_size);
           var options = {
             title: "Test Suite Running Density",
             calendar: { cellSize: cell_size }
           };

           chart.draw(dataTable, options);
       }

       