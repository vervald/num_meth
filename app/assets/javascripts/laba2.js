function interpolate_straight()
{
	var f = document.getElementById('f').value;
	f = f.replace( /Math./gi, "")
		.replace(/(exp|log|pow|sin|cos|tan|sqrt|abs|acos|asin|atan)/g, function (match) {return "Math." + match})
		.replace("+", "%2B")
	var nodes = [];
	var n = 4 * parseInt(document.getElementById('n').value);
	var a = parseInt(document.getElementById('a').value);
	var b = parseInt(document.getElementById('b').value);
	$.ajax({url: "/solver/straight?func=" + f + "&a=" + a + "&b=" + b + "&n=" + n, timeout: 600000,
		error: function()
		{
			alert("lol error or timeout");
		},
		success: function(data)
		{
			var plot = [], realplot = [];
			for(var i in data.x)
			{
				plot.push([data.x[i], data.y[i]])
				realplot.push([data.x[i], data.real_y[i]]);
			}
			$("#answer").html("").jqplot("plot1", [plot], {series: [{color: '#FF0000', showMarker: false}], title: "Интерполяция", axes: {xaxis: {label: "x"}, yaxis: {label: "y"}}})
			$("#answer_real").html("").jqplot("plot2", [realplot], {series: [{showMarker: false}], title: "f(x)", axes: {xaxis: {label: "x"}, yaxis: {label: "y"}}})
		}
	});
	document.getElementById("answer").innerHTML = "Подождите...";
	document.getElementById("answer_real").innerHTML = "Подождите...";
}

function interpolate_reversed()
{
	var f = document.getElementById('f').value;
	f = f.replace( /Math./gi, "")
		.replace(/(exp|log|pow|sin|cos|tan|sqrt|abs|acos|asin|atan)/g, function (match) {return "Math." + match})
		.replace("+", "%2B")
	var nodes = [];
	var n = 4 * parseInt(document.getElementById('n').value);
	var a = parseInt(document.getElementById('a').value);
	var b = parseInt(document.getElementById('b').value);
	$.ajax({url: "/solver/reverse?func=" + f + "&a=" + a + "&b=" + b + "&n=" + n, timeout: 600000,
		error: function()
		{
			alert("lol error or timeout");
		},
		success: function(data)
		{
			var plot = [], realplot = [];
			for(var i in data.x)
			{
				plot.push([data.x[i], data.y[i]])
				realplot.push([data.x[i], data.real_y[i]]);
			}
			$("#answer").html("").jqplot("plot1", [plot], {series: [{color: '#FF0000', showMarker: false}], title: "Интерполяция", axes: {xaxis: {label: "x"}, yaxis: {label: "y"}}})
			$("#answer_real").html("").jqplot("plot2", [realplot], {series: [{showMarker: false}], title: "f(x)", axes: {xaxis: {label: "x"}, yaxis: {label: "y"}}})
		}
	});
	document.getElementById("answer").innerHTML = "Подождите...";
	document.getElementById("answer_real").innerHTML = "Подождите...";
}

function statistics()
{
	var from_dim = document.getElementById('from_dim').value;
	var to_dim = document.getElementById('to_dim').value;
	$.ajax({url: "/solver/package_qr?mat_cnt=10&from_val=1&to_val=10&from_dim=" + from_dim + "&to_dim=" + to_dim,
		timeout: 3600000,
		error: function()
		{
			alert("lol error or timeout");
		},
		success: function(data)
		{
			var iters = [], times = [];
			for(var n in data)
			{
				if(data[n] != null)
				{
					iters.push([parseInt(n), data[n].avr_iter]);
					times.push([parseInt(n), data[n].avr_time]);
				}
			}
			alert(JSON.stringify(iters));
			$("#plot1").html("").jqplot('plot1', [iters], {title: "QR итерации"});
			$("#plot2").html("").jqplot('plot2', [times], {title: "QR время", axes: {yaxis: {label: "Время, мс"}}});
		}
	});
	$.ajax({url: "/solver/package_krilov?mat_cnt=10&from_val=1&to_val=10&from_dim=" + from_dim + "&to_dim=" + to_dim,
		timeout: 3600000,
		error: function()
		{
			alert("lol error or timeout");
		},
		success: function(data)
		{
			var times = [];
			for(var n in data)
			{
				if(data[n] != null)
				{
					times.push([parseInt(n), data[n].avr_time]);
				}
			}
			alert(JSON.stringify(times));
			$("#plot3").html("").jqplot('plot3', [times], {title: "Крылов время", axes: {yaxis: {label: "Время, мс"}}});
		}
	});
}
