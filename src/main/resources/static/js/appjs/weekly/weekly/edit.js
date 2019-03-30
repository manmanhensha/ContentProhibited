$().ready(function () {
    load();
});
//定义成员变量，来接受编辑之后的值。
var project;
var workDes;
var problem;
var task;
var priority;
var status;
var id = $('#id').val();
var editurl = "/weekly/weekly/get/";

function load() {
    /*使表格中的内容能够编辑并且保存，并能传递到后端*/
    var $table = $('#exampleTable');

    function saveData(index, field, value) {
        $table.bootstrapTable('updateCell', {
            index: index, //行索引
            field: field, //列名
            value: value //cell值
        })
    }

    $('#exampleTable').bootstrapTable({
        method: 'get', // 服务器数据的请求方式 get or post
        url: editurl + id,
        iconSize: 'outline',
        toolbar: '#exampleToolbar',
        striped: false, // 设置为true会有隔行变色效果
        dataType: "json", // 服务器返回的数据类型
        pagination: false, // 设置为true会在底部显示分页条
        singleSelect: false, // 设置为true将禁止多选
        pageSize: 10, // 如果设置了分页，每页数据条数
        pageNumber: 1, // 如果设置了分布，首页页码
        showColumns: false, // 是否显示内容下拉框（选择显示的列）
        sidePagination: "server",// 是否显示内容下拉框（选择显示的列）
        onClickCell: function (field, value, row, $element) {
            $element.attr('contenteditable', true);
            $element.blur(function () {
                var index = $element.parent().data('index');
                var tdValue = $element.html();
                saveData(index, field, tdValue);
            })
        },
        columns: [
            {
                field: 'project',
                title: '项目',
                width: 70,
                align: 'center',
                formatter: function (value) {
                    project = value;
                    return project;
                }
            },
            {
                field: 'workDes',
                title: '工作内容描述',
                align: 'center',
                formatter: function (value) {
                    workDes = value;
                    return workDes;
                }
            },
            {
                field: 'problem',
                title: '问题及解决方案',
                align: 'center',
                formatter: function (value) {
                    problem = value;
                    return problem;
                }
            },
            {
                field: 'task',
                title: '任务性质',
                align: 'center',
                formatter: function (value) {
                    task = value;
                    return task;
                }
            },
            {
                field: 'priority',
                title: '优先级',
                align: 'center',
                formatter: function (value) {
                    priority = value;
                    return priority;
                }
            },
            {
                field: 'status',
                title: '当前状态',
                align: 'center',
                formatter: function (value) {
                    status = value;
                    return status;
                }
            }
        ]
    });
}

$.validator.setDefaults({
    submitHandler: function () {
        save();
    }
});

function save() {
    var data = "project=" + project + "&workDes=" + workDes + "&problem=" + problem
        + "&task=" + task + "&priority=" + priority + "&status=" + status + "&id=" +
        id+"&title=" + $('#title').val();
    $.ajax({
        cache: true,
        type: "POST",
        url: "/weekly/weekly/update",
        data: data,
        async: false,
        error: function (request) {
            parent.layer.alert("Connection error");
        },
        success: function (data) {
            if (data.code == 0) {
                parent.layer.msg("操作成功");
                location.reload();
            } else {
                parent.layer.alert(data.msg);
            }
        }
    });
}


