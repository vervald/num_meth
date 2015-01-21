function solve()
{
	var f = document.getElementById('func').value;
	f = f.replace( /Math./gi, "")
		.replace(/(exp|log|pow|sin|cos|tan|sqrt|abs|acos|asin|atan)/g, function (match) {return "Math." + match})
		.replace("+", "%2B")
	var nodes = [];
	var h = parseFloat(document.getElementById('h').value);
	var from = parseInt(document.getElementById('from').value);
	var to = parseInt(document.getElementById('to').value);
	var id = document.getElementById('id').value;
	var init_x = parseInt(document.getElementById('init_x').value);
	var init_y = parseInt(document.getElementById('init_y').value);
	$.ajax({url: "/solver/adams?func=" + f + "&from=" + from +
		"&to=" + to + "&h=" + h + "&init_x=" + init_x + "&init_y=" + init_y +
		"&id=" + id, timeout: 600000,
		error: function()
		{
			alert("lol error or timeout");
		},
		success: function(data)
		{
			var plot = [];
			for(var i in data.x)
			{
				plot.push([data.x[i], data.y[i]])
			}
			$("#answer").html("").jqplot("plot1", [plot], {series: [{color: '#FF0000', showMarker: false}], title: "Интерполяция", axes: {xaxis: {label: "x"}, yaxis: {label: "y"}}})
		}
	});
	document.getElementById("answer").innerHTML = "Подождите...";
}
