var prefix = "/weekly/weekly";

$(function () {
    laydate.render({
        elem: '#test1'
       // , value: new Date(new Date().getTime() - 7 * 24 * 60 * 60 * 1000)
        , format: 'yyyy-MM-dd'
    });
    laydate.render({
        elem: '#test2'
        , value: new Date(new Date().getTime())
        , format: 'yyyy-MM-dd'
    });
    load();
});

function load() {

    $('#exampleTable').bootstrapTable(
        {
            method: 'get', // 服务器数据的请求方式 get or post
            url: prefix + "/list", // 服务器数据的加载地址
            iconSize: 'outline',
            toolbar: '#exampleToolbar',
            striped: true, // 设置为true会有隔行变色效果
            dataType: "json", // 服务器返回的数据类型
            pagination: true, // 设置为true会在底部显示分页条
            singleSelect: false, // 设置为true将禁止多选
            pageSize: 10, // 如果设置了分页，每页数据条数
            pageNumber: 1, // 如果设置了分布，首页页码
            showColumns: false, // 是否显示内容下拉框（选择显示的列）
            sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者 "server"
            showRefresh: true, // 增加页面刷新按钮
            queryParams: function (params) {
                return {
                    //说明：传入后台的参数包括offset开始索引，limit步长，sort排序列，order：desc或者,以及所有列的键值对
                    limit: params.limit,
                    offset: params.offset,
                    name: $('#searchName').val(),
                    beginTime: $('#test1').val(),
                    endTime: $('#test2').val()
                };
            },
            columns: [
                {
                    field: 'title',
                    title: '周报标题',
                    width: 320,
                    align: 'center'
                },
                {
                    field: 'name',
                    title: '提交用户',
                    align: 'center'
                },
                {
                    field: 'createTime',
                    title: '创建时间',
                    align: 'center'
                },
                {
                    field: 'updateTime',
                    title: '更改时间',
                    align: 'center'
                },
                {
                    title: '批阅',
                    field: 'id',
                    align: 'center',
                    formatter: function (value, row, index) {
                        var e = '<a class="btn btn-primary btn-sm ' + s_edit_h + '" ' +
                            'href="#" mce_href="#" title="查看" onclick="editIsRead(\''
                            + row.id
                            + '\')"><i class="fa fa-edit"></i></a> ';
                        return e;
                    }
                }
            ]
        });
}

function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}

function exportExcel() {
    location.href = prefix + "/exportWeekly?beginTime="+$('#test1').val()
        +"&endTime="+$('#test2').val()+"&name="+$('#searchName').val();
}

function add() {
    layer.open({
        type: 2,
        title: '增加',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/add' // iframe的url
    });
}

function editIsRead(id) {
    layer.open({
        type: 2,
        title: '编辑',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/editIsRead/' + id // iframe的url
    });
}

function remove(id) {
    layer.confirm('确定要删除选中的记录？', {
        btn: ['确定', '取消']
    }, function () {
        $.ajax({
            url: prefix + "/remove",
            type: "post",
            data: {
                'id': id
            },
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    })
}

function resetPwd(id) {
}

function batchRemove() {
    var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
    if (rows.length == 0) {
        layer.msg("请选择要删除的数据");
        return;
    }
    layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        var ids = new Array();
        // 遍历所有选择的行数据，取每条数据对应的ID
        $.each(rows, function (i, row) {
            ids[i] = row['id'];
        });
        $.ajax({
            type: 'POST',
            data: {
                "ids": ids
            },
            url: prefix + '/batchRemove',
            success: function (r) {
                if (r.code == 0) {
                    layer.msg(r.msg);
                    reLoad();
                } else {
                    layer.msg(r.msg);
                }
            }
        });
    }, function () {

    });
}
