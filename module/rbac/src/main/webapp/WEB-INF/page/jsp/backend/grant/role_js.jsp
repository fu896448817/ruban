<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<script type="text/javascript">
(function(){
	var rubanRole = {};
	
	// 获取访问地址
	getRealPath = function(path){
		var basePath = '<s:url value="/rbac/backend/role/" />';
		return basePath + path;
	};
	
    $('body').on('click', '.add', function(){
    	
    	var targetId = "#role_add_form";
    	
		// 数据提交
		var submit = function(){
			
	    	// 成功回调
			var success = function(data){
				msgAlert(data);
				// 更新数据
				rubanRole.search();
			}
	    	
			var options = ajaxOption(getRealPath("add"),success);
			$(targetId).ajaxSubmit(options);
		};
		
		var success = function(html){
	    	layer.open({
	    		title: '添加角色',
	    		area:['750px'],
	    		content: html,
	    		btn:['添加', '关闭'],
	    		yes:function(index, layer){
	    			// 校验数据成功后提交
	    			validate($(targetId),submit);
	    		},
	    		success:function(){
	    	    	// 绑定页面校验
	    	    	bindValidate($(targetId));
	    		}
	    	});
		};
    	
		// 数据请求
		ajaxHybrid(getRealPath("add"),{},success);
    });
    
    // 部门排序
    $('body').on('click', '.sort', function(){
		// 成功回调
		var success = function(html){
	    	layer.open({
	    		title: '角色排序',
				btn: ['保存','关闭'],
	    		area:["828px"],
			    content: html,
			    yes: function(){
			    	var ids = $("[name=role_sort_id]");
			    	
			    	var data = "";
			    	ids.each(function(){
			    		if(data == "") {
			    			data = $(this).val();
			    		} else {
			    			data += "," + $(this).val();
			    		}
			    	});
			    	
			    	// 成功提示
			    	var success = function(data){
			    		msgAlert(data);
			    	};
			    	
					// 数据提交
					ajaxJson(getRealPath("sort"),{"ids":data},success);
			    }
	    	});
		};
		
		// 查询条件
		var searchData = {"departmentId" : dptTree.getCurrentId()};
		// 数据请求
		ajaxHtml(getRealPath("sortList"),searchData,success);
    });
    
    // 删除角色
	rubanRole.batchDelete = function(){
    	// 获取所有选中的ids
    	var ids = getSelections("role_checkbox","role_id");

    	if(ids!="") {
			// 删除确认
			layer.confirm('确定要删除么？', {
				  btn: ['确定','关闭']
				}, function(){
			    	// 成功回调
					var success = function(data){
			    		msgAlert(data);
						// 更新数据
						rubanRole.search();
					}
					var data = {"ids":ids};
					ajaxJson(getRealPath("batchDelete"), data, success);
			});
    	} else {
    		layer.alert("请选择要删除的数据！");
    	}
	 };
    
    // 查询
    rubanRole.search = function(){

		// 成功回调
		var success = function(html){
			$("#roleListTd").html(html);
		};
    	
		var options = ajaxOptionHtml(getRealPath("search"), success);
		// 添加分页数据
		addAjaxData(options,pagination.getPageData());
		
		$("#searchForm").ajaxSubmit(options);
    };
    
    // 修改人员信息
    rubanRole.update = function(id){

		var success = function(html){
			
			var target_id = "#role_update_form";
			
			// 提交数据
			var submit = function(){
    			var options = ajaxOption(getRealPath("update"),function(data){
    				msgAlert(data);
    				// 更新数据
    				rubanRole.search();
    			});
    			$(target_id).ajaxSubmit(options);
			};

	    	layer.open({
	    		title: '修改角色',
	    		area: ["750px"],
	    		content: html,
	    		btn: ['修改', '关闭'],
	    		yes: function(index, layer){
	    			validate($(target_id),submit);
	    		},
	    		success: function(){
	    	    	// 页面校验
	    	    	bindValidate($(target_id));
	    		}
	    	});
		};
		
		// 请求明细数据
		var data = {"id":id};
		
		// 数据请求
		ajaxHybrid(getRealPath("update"),data,success);
    };
    
    // 查看部门
    rubanRole.detail = function(id){
    	
    	// 成功回调函数
    	var success = function(data){
    		
    		if(data.flag == '0') {
    			layer.alert("无结果");
    		} else {
		    	layer.open({
		    		title: '查看角色',
		    		area:["800px"],
		    		content: data,
		    		btn: ['关闭']
		    	});
    		}
		};
		
    	// 请求数据
    	var data = {"id":id};
		ajaxHybrid(getRealPath("detail"),data,success);
    };
    
    
    // 删除人员
    rubanRole.deleteSingle = function(id){
    	var data = {"id":id};
		// 成功回调
    	var success = function(data){
    		msgAlert(data);
			// 更新数据
			rubanRole.search();
		};
		
		// 删除确认
		layer.confirm('确定要删除么？', {
			  btn: ['确定','关闭']
			}, function(){
				ajaxJson(getRealPath("delete"), data, success);
		});
    };
    
    // 排序角色
    rubanRole.sortByFlag = function(flag){
    	// 取消之前选中的
    	var radioSelected = getSelectedRadio("role_sort_radio");
		var tr = $(radioSelected).parent().parent();
		if(radioSelected == null) {
			parent.layer.alert("请选中要排序的行！");
			return;
		}
		// 上移
		if(flag==0) {
    		var prev = tr.prev();
    		if(prev.length==1) {
    			prev.before(tr);
    		} else {
    			parent.layer.alert("已到达最顶部，无法再移动！");
    		}
		} else {
			// 下移
    		var next = tr.next();
    		if(next.length==1) {
    			next.after(tr);
    		} else {
    			parent.layer.alert("已到达最底部，无法再移动！");
    		}
		}
    };
    
    window['rubanRole'] = rubanRole;
})();
</script>
