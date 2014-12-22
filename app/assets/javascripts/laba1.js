function genMatrix()
{
	$.ajax({url: "/solver/gen_matrix", success: function(data)
			{
				document.getElementById('matrix').value = data;
			}
	})
}

function eigenvalues()
{
	var matrix = document.getElementById('matrix').value;
	$.ajax({url: "/solver/qr?matrix=" + matrix, timeout: 600000,
		error: function()
		{
			alert("lol error or timeout");
		},
		success: function(data)
		{
			document.getElementById("answer").innerHTML = data.answer.join("<br/>");
			document.getElementById("iter").innerHTML = data.iter_cnt;
		}
	});
	document.getElementById("iter").innerHTML = "";
	document.getElementById("answer").innerHTML = "Подождите...";
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
}
