var chart;
var series = [
// { name: 'GXC', data: [] },
{
	name : 'btai',
	data : []
} ];

function ticker(idx) {
	$.ajax({
		url : 'https://api.bithumb.com/public/btci',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			point = [ Date.now(), data['data']['btai']['rate'] * 1 ];

			var series = chart.series[idx], shift = series.data.length > 20;
			chart.series[idx].addPoint(point, true, shift);
		},
	});
};

function requestData() {
	for ( var idx in series) {
		ticker(idx);
	}
	setTimeout(requestData, 1000);
}

$(document).ready(function() {
	Highcharts.setOptions({
		global : {
			useUTC : false
		}
	});
	chart = new Highcharts.Chart({
		chart : {
			renderTo : 'container',
			defaultSeriesType : 'spline',
			events : {
				load : requestData
			}
		},
		title : {
			text : 'BTS BTAI'
		},
		xAxis : {
			type : 'datetime',
			tickPixelInterval : 150,
			maxZoom : 20 * 1000
		},
		yAxis : {
			minPadding : 0.2,
			maxPadding : 0.2,
			title : {
				text : 'price',
				margin : 80
			}
		},
		series : series
	});
});