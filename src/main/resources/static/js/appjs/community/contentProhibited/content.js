$().ready(function () {
    $('.summernote').summernote({
        height: '220px',
        lang: 'zh-CN',
        callbacks: {}
    });

    validateRule();
});

function query() {
    var len = $('#content').val();

    if (len.length > 0) {
        $.ajax({
            cache: true,
            type: "POST",
            contentType: false,
            url: "/prohibited/contentProhibited",
            data: $('#content').val(),
            async: false,
            error: function (request) {
                parent.layer.alert("Connection error");
            },
            success: function (r) {
                if (r.code == 0) {
                    parent.layer.msg("核查成功！");

                    // $('#backcontent').html(r.content);
                    // var content = $("#backcontent").val();
                    $('#content_sn').summernote('code', r.content);
                } else {
                    parent.layer.alert(r.msg);
                }
            }
        });
    } else {
        parent.layer.alert("请输入内容！")
    }
}

function validateRule() {
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#content").validate({
        rules: {
            content: {
                required: true
            }
        },
        messages: {
            content: {
                required: icon + "输入内容不能为空"
            }
        }
    })
}