 //1.得到XMLHttpRequest对象

       function getXMLHttpRequest(){
       	
       	
       	   try{//非IE浏览器
       	   	
       	   	return  new XMLHttpRequest();
       	   	
       	   }catch(e){
       	   	
       	   	
       	   	   try{//ie低版本
       	   	   	
       	   	   	   return new AcitveXObject("Microsoft.XMLHTTP");
       	   	   	
       	   	   }catch(e){
       	   	   	
       	   	   	
       	   	   	    try{//ie高版本的
       	   	   	    	
       	   	   	    	return new ActiveXObject("Msxml2.XMLHTTP");
       	   	   	    	
       	   	   	    }catch(e){
       	   	   	    	//这个情况一般不会发生
       	   	   	    	
       	   	   	    	alert("哥们，你用的浏览器是什么鬼？请换一个吧");
       	   	   	    	
       	   	   	    	throw e;
       	   	   	    	
       	   	   	    }
       	   	   	
       	   	   	
       	   	   }
       	   	
       	   }
       	
       	
       }
       
      //封装一个ajax的方法
       
       //1.请求方式  method  get post
       //2.请求地址  url
       //3.是否异步  ansy   true;
       //4.参数    params
       //5.返回数据类型  type
       //6.成功之后处理的方法  success()
       
       //把这六个参数绑定在一个对象上
      
       /*
        * {
        *  method:"POST",
        *  url:"TESTServlet",
        *  ansy:true,
        *  params:"action",
        *  type:"xml",
        *  success:function(){
        *  
        *  
        *  }
        * 
        * 
        * }
        * 
        * 
        */
       
       //opt
       function ajax(opt){
       	
       	
       	//1.得到对象
       	
       	var http=getXMLHttpRequest();
       	
       	//2.打开连接
       	
       	
       	//method默认不传的话，我就是get请求
       	
       	if(!opt.method){
       		
       		opt.method="GET";
       	}
       	
       	//ansy 一般都是异步
       	
       	if(opt.ansy==undefined){
       		
       		
       		opt.ansy=true;
       	}
       	
       	http.open(opt.method,opt.url,opt.ansy);
       	
       	//3.发送请求
       	
       	//如果是post请求，发送头信息
       	
       	if(opt.method=="POST"){
       		
       		
       		http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
       	}
       	
       	http.send(opt.params);
       	
       	//4.监听请求响应的变化
       	
       	http.onreadystatechange=function(){
       		
       		
       		if(http.readyState==4&& http.status==200){
       			
       			
       			var data;
       			
       			//如果type类型不传，我们默认就是字符串
       			
       			if(!opt.type){
       				
       				
       				
       				data=http.responseText;
       			
       			}else if(opt.type=="text"){//代表普通字符串
       				
       				data=http.responseText;
       				
       			}else if(opt.type=="xml"){
       				
       				
       				
       				data=http.responseXML;
       				
       			}else if(opt.type=="json"){
       				
       				var content=http.responseText;
       				
       				data=eval("("+content+")");
       			}
       			
       			//交个success方法来处理
       			
       			opt.success(data);
       			
       		}
       		
       	}
       	
       }