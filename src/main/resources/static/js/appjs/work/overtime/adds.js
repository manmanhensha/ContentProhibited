$().ready(function() {
    /*validateRule();*/
    selectloads();  //加载姓名
});


//批量添加加载姓名
function selectloads(){
    /*姓名选择框*/
    var html_workName = "";
    $.ajax({
        url: '/work/overtime/worker',
        success: function (data) {
            //加载数据
            for (var i = 0; i < data.length; i++) {
                html_workName += '<input value="' + data[i].userId + '"   type="checkbox" name="ids" title="'+ data[i].name+'"/>'
            }
            $("#check-select").append(html_workName);
            /*$(".chosen-select2").chosen({
                maxHeight: 200
            });*/

        }
    });
}

function save() {
    var arr = new Array();
    $("input[type='checkbox']:checked").each(function (index, item) {
        arr.push($(this).val());
    });
    if(arr.length != 0){
        $.ajax({
            type : "POST",
            url : "/work/overtime/saveIds",
            data : {
                "ids" : arr,
                "beginTime": $('#begintime').val(),
                "endTime" : $('#endtime').val(),
                "state" : $('#state').val(),
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
    }else {
        alert("请选择员工");
    }


}