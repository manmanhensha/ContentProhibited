$().ready(function () {
    /*从日历页面传递过来的参数*/
    var arg = window.location.href.split("=")[1];
    // var arg = $('#calendar').val();
    laydate.render({
        elem: '#test1'
        , value: arg
        , format: 'yyyy-MM-dd'
        , min: -30
        , max: 0
    });
    load();
    validateRule();
});

//定义成员变量，来接受编辑之后的值。
var project;
var workDes;
var problem;
var task;
var priority;
var status;

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

    $('#exampleTable').bootstrapTable(
        {
            method: 'get', // 服务器数据的请求方式 get or post
            url: '/js/appjs/weekly/weekly/weekly.json', // 请求本地json----
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
                //使单元格进行可编辑
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
                    width: 170,
                    align: 'center',
                    formatter: function (value) {
                        workDes = value;
                        return workDes;
                    }
                },
                {
                    field: 'problem',
                    title: '问题及解决方案',
                    width: 170,
                    align: 'center',
                    formatter: function (value) {
                        problem = value;
                        return problem;
                    }
                },
                {
                    field: 'task',
                    title: '任务性质',
                    width: 70,
                    align: 'center',
                    formatter: function (value) {
                        task = value;
                        return task;
                    }
                },
                {
                    field: 'priority',
                    title: '优先级',
                    width: 70,
                    align: 'center',
                    formatter: function (value) {
                        priority = value;
                        return priority;
                    }
                },
                {
                    field: 'status',
                    title: '当前状态',
                    width: 70,
                    align: 'center',
                    formatter: function (value) {
                        status = value;
                        return status;
                    }
                }
            ]
        });
}

//提交到保存位置
$.validator.setDefaults({
    submitHandler: function () {
        save();
    }
});

function save() {
    var data = "title=" + $('#title').val() + "&createTime=" + $('#test1').val()
        + "&project=" + project + "&workDes=" + workDes + "&problem=" + problem
        + "&task=" + task + "&priority=" + priority + "&status=" + status;

    $.ajax({
        cache: true,
        type: "POST",
        url: "/weekly/weekly/save",
        data: data,
        async: false,
        error: function (request) {
            parent.layer.alert("Connection error");
        },
        success: function (r) {
            if (r.code == 0) {
                parent.layer.msg(r.msg);
                location.reload();
                $("#id").val(r.id);
            } else {
                parent.layer.alert("该日期已有周报内容");
            }
        }
    });
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i>";
    $("#signupForm").validate({
        rules: {
            title: {
                required: true,
                maxlength: 20
            },
            test1: {
                required: true,
                dateISO: true
            },
            content_sn: "required"
        },
        messages: {
            title: {
                required: "请填写周报标题",
                minlength: "周报标题不能超过20字"
            },
            test1: {
                required: "请填写日期",
                dateISO: "日期格式不正确"
            },
            content_sn: "请填写周报内容"
        }
    });
}