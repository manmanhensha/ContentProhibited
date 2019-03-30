var prefix = "/weekly/weekly";
var clickTime;
$(document).ready(function () {

    $('#calendar').fullCalendar({
        customButtons: {
            myCustomButton: {
                text: '点击刷新',
                click: function () {
                    location.reload();
                }
            }
        },
        header: {
            left: 'prev,next today myCustomButton',
            center: 'title',
            right: 'month'
        },
        height: 580,
        overlap: false,
        defaultDate: new Date(),
        locale: 'zh-cn',
        editable: false,
        showWeekNumbers: true,
        weekNumbers: true,
        eventOrder : Function/String, //多个相同的日程数据排序方式，String / Array / Function, 默认值: "title"
        dayClick: function (date, jsEvent, view) {
            clickTime = date.format();
            edit(clickTime);
            //location.reload();
            //$(this).css('background-color', 'green');
        },
        eventLimit: true,
        events: getWeekly()
    });
});
var weeklyTitle;

function getWeekly() {
    var event = [];
    $.ajax({
        url: prefix + '/listWeekly',
        async: false,
        success: function (data) {
            $.each(data, function (i, c) {
                weeklyTitle = data[i].title;
                var read = data[i].isRead;
                if (weeklyTitle === '' || weeklyTitle === null || weeklyTitle === undefined) {
                    add(clickTime);
                }
                event.push({
                    title: weeklyTitle,
                    start: data[i].createTime
                });
                if (read === 1) {
                    read = "已批阅";
                    event.push({
                        title: read,
                        start: data[i].createTime,
                        //添加字体颜色
                        color: 'yellow',
                        textColor: 'black'
                    });
                }
            })
        }
    });
    return event;
}

function add(clickDate) {
    layer.open({
        type: 2,
        title: '增加',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['800px', '520px'],
        content: prefix + '/add?clickDate=' + clickDate // iframe的url
    });
}

function edit(clickDate) {
    layer.open({
        type: 2,
        title: '编辑',
        maxmin: true,
        shadeClose: false,
        area: ['800px', '520px'],
        content: prefix + '/editBytime/' + clickDate // iframe的url
    });
}