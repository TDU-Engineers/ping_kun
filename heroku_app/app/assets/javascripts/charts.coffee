# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#coffeescript.org/

$ ->
  w = $('.wrapper').width();
  h = $('.wrapper').height();
  $('#canvas').attr('width', w);
  $('#canvas').attr('height', h);
  console.log("reading success");
  $(document).on 'ready', ->
  ctx = document.getElementById('myChart').getContext("2d");
  if ctx != null
    data =
      labels: thisTime()
      datasets: [ {
        label: 'Ping time'
        fill: false
        lineTension: 0.1
        backgroundColor: 'rgba(75,192,192,0.4)'
        borderColor: 'rgba(75,192,192,1)'
        borderCapStyle: 'butt'
        borderDash: []
        borderDashOffset: 0.0
        borderJoinStyle: 'miter'
        pointBorderColor: 'rgba(75,192,192,1)'
        pointBackgroundColor: '#fff'
        pointBorderWidth: 1
        pointHoverRadius: 5
        pointHoverBackgroundColor: 'rgba(75,192,192,1)'
        pointHoverBorderColor: 'rgba(220,220,220,1)'
        pointHoverBorderWidth: 2
        pointRadius: 1
        pointHitRadius: 10
        data: gon.info
        } ]

    myChart = new Chart.Line(ctx,
      data: data
      options:
        scales: yAxes: [ { ticks:
          beginAtZero: true
          min: 0
          scaleShowLabelBackdrop : true
          scaleShowLabels : true
          scaleLabel: "<%=value%>A"
          max: 100 } ]
    )
