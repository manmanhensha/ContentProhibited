$().ready(function() {
	validateRule();
    selectload();  //加载姓名
});

$.validator.setDefaults({
	submitHandler : function() {
		save();
	}
});
function save() {
	$.ajax({
		cache : true,
		type : "POST",
		url : "/work/overtime/save",
		data : $('#signupForm').serialize(), // 你的formid
		async : false,
		error : function(request) {
			parent.layer.alert("网络超时");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);

			} else {
				parent.layer.alert(data.msg)
			}

		}
	});

}
function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
			name : {
				required : true
			}
		},
		messages : {
			name : {
				required : icon + "请输入名字"
			}
		}
	})
}

function selectload() {

    /*姓名选择框*/
    var html_workName = "";
    $.ajax({
        url: '/work/overtime/worker',
        success: function (data) {
            //加载数据
            for (var i = 0; i < data.length; i++) {
                html_workName += '<option value="' + data[i].userId + '">' + data[i].name + '</option>'
            }
            $(".chosen-select2").append(html_workName);
            $(".chosen-select2").chosen({
                maxHeight: 200
            });
            //点击事件
            $('.chosen-select2').on('change', function (e, params) {
                console.log(params.selected);
                selectWorkNum(params.selected);  //工号框自动赋值
               /* var opt = {
                    query: {
                        workNum: params.selected,
                    }
                }*/
                /*$('#exampleTable').bootstrapTable('refresh', opt);*/
            });
        }
    });
}
function selectWorkNum(WorkNum){
	$('#name').val(WorkNum);
}