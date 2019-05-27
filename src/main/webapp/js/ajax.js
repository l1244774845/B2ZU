

function getXMLHttpRequest() {

	try {

		return new XMLHttpRequest();

	} catch (e) {

		try {

			return new AcitveXObject("Microsoft.XMLHTTP");

		} catch (e) {

			try {

				return new ActiveXObject("Msxml2.XMLHTTP");

			} catch (e) {

				alert("没有找到浏览器");

				throw e;

			}

		}

	}

}

// 封装一个ajax 方法、

 function ajax(opt) {

	// 1.get target(对象)

	var http = getXMLHttpRequest();

	// 2.open connect (打开链接)

	if (!opt.method) {// 默认不传的话本身就是get请求

		opt.method = "GET";
	}

	if (opt.ansy == undefined) {

		opt.ansy = true;
	}
     http.open(opt.method,opt.url,opt.ansy);  
	// 3.响应参数

	 	

	if (opt.method == "POST") {

		http.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
	}

	http.send(opt.params);

	// 4.监听响应请求

	http.onreadystatechange = function() {

		if (http.readyState == 4 && http.status == 200) {

			var data;

			if (!opt.type) {

				data = http.responseText;

			} else if (opt.type == "text") {// 代表普通字符串

				data = http.responseText;

			} else if (opt.type == "xml") {

				alert("ok");

				data = http.responseXML;

			} else if (opt.type == "json") {

				var content = http.responseText;

				data = eval("(" + content + ")");
			}

			// finally 交给success 方法来处理data

			opt.success(data);
		}
	}
}