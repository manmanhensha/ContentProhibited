/**
 id,             表格页面ID
 url,            请求URL
 columns,   字段数组
 columnsId 主键ID列名
 queryParams 查询条件
 */
function communityTable() {

    var table;

    //初始化TABLE
    this.Init = function (id, url, columns, columnsId, _queryParam) {
        table = $('#' + id);
        //alert(JSON.stringify(_queryParam));
        table.bootstrapTable('destroy');
        //var tableLoadId = layer.msg("查询中……", {icon: 16, shade: 0.6, time: 0});
        table.bootstrapTable({
            url: url,
            method: 'get',
            contentType: "application/x-www-form-urlencoded",
            dataType: 'json',
            striped: true,
            cache: false,
            pagination: true,
            singleSelect: false,
            sortable: true,                      //是否启用排序
            //toolbar:"#toolbar",
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                       //初始化加载第一页，默认第一页
            pageSize: 10,                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            strictSearch: true,
            clickToSelect: true,                //是否启用点击选中行
            //height: 460,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: columnsId,                     //每一行的唯一标识，一般为主键列
            cardView: false,                    //是否显示详细视图
            detailView: false,                   //是否显示父子表
            locale: 'zh-CN',//中文支持
            columns: columns,
            queryParams: function (params) {
                console.log(params);
                $.extend(params, _queryParam);
                return params;
            },
            onLoadSuccess: function (data) {
                //layer.close(tableLoadId);
            }, onLoadError: function () {
                //layer.close(tableLoadId);
            }
        });
    }
}

$.ajaxSettings.async = false;
var communityFixcode = {};
$.getJSON("/js/appjs/community/fixcode.json", function (data) {
    communityFixcode = data;
});
$.ajaxSettings.async = true;

function showSelect(sid, type, option, value) {
    $.ajaxSettings.async = false;
    $.getJSON("/js/appjs/community/fixcode.json", function (data) {
        var selectObj = $("#" + sid);
        selectObj.empty();
        if (option) {
            selectObj.append('<option value="">请选择</option>');
        }

        $.each(eval('data.' + type), function (infoIndex, info) {
            var selected = "";
            if (info.value == value) {
                selected = "selected";
            }
            selectObj.append('<option value="' + info.value + '" ' + selected + '>' + info.name + '</option>');
        });
        $.ajaxSettings.async = true;
    })
}

function showSelect(sid, type, option, value) {
    var selectObj = $("#" + sid);
    selectObj.empty();
    if (option) {
        selectObj.append('<option value="">请选择</option>');
    }

    $.each(eval('communityFixcode.' + type), function (infoIndex, info) {
        var selected = "";
        if (info.value == value) {
            selected = "selected";
        }
        selectObj.append('<option value="' + info.value + '" ' + selected + '>' + info.name + '</option>');
    });
};

function showFixName(type, value) {
    var str = "";
    $.each(eval('communityFixcode.' + type), function (infoIndex, info) {
        if (info.value == value) {
            str = "<span class=\"label " + info.style + " \">" + info.name + "</span>";
            return false;
        }
    });
    return str;
}

function sendCommunityFile(files, editor, $editable) {
    var size = files[0].size;
    if ((size / 1024 / 1024) > 2) {
        alert("图片大小不能超过2M...");
        return false;
    }
    console.log("size=" + size);
    var formData = new FormData();
    formData.append("file", files[0]);
    $.ajax({
        data: formData,
        type: "POST",
        url: "/community/upload/single",    // 图片上传出来的url，返回的是图片上传后的路径，http格式
        cache: false,
        contentType: false,
        processData: false,
        dataType: "json",
        success: function (data) {//data是返回的hash,key之类的值，key是定义的文件名
            $('.summernote').summernote('insertImage', data.msg);
        },
        error: function () {
            alert("上传失败");
        }
    });
}