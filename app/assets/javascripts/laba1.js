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
		}
	});
	document.getElementById("answer").innerHTML = "Подождите...";
}
