// $(function(){
$(document).ready(function () {
    //页面加载完成之后执行
    pageInit();

});
function pageInit(){
    //创建jqGrid组件
    jQuery("#list2").jqGrid(
        {
            url : '../data/JSONData.json',//组件创建完成之后请求数据的url
            datatype : "json",//请求数据返回的类型。可选json,xml,txt
            // colNames : [ 'Inv No', 'Date', 'Client', 'Amount', 'Tax','Total', 'Notes' ],//jqGrid的列显示名字
            colModel : [ //jqGrid每一列的配置信息。包括名字，索引，宽度,对齐方式.....
                {name : 'id',       index : 'id',                 label: '序号',    width : 55},
                {name : 'invdate',  index : 'invdate',            label: '时间',    width : 90},
                {name : 'name',     index : 'name asc, invdate',  label: '客户端',    width : 100},
                {name : 'amount',   index : 'amount',             label: '数量',   width : 80,align : "right"},
                {name : 'tax',      index : 'tax',                label: '税率',   width : 80,align : "right"},
                {name : 'total',    index : 'total',              label: '总计',   width : 80,align : "right"},
                {name : 'note',     index : 'note',               label: '备注',   width : 150,sortable : false}
            ],
            rowNum : 100,//一页显示多少条
            rowList : [ 10, 20, 30 ],//可供用户选择一页显示多少条
            pager : '#pager2',//表格页脚的占位符(一般是div)的id
            sortname : 'id',//初始化的时候排序的字段
            sortorder : "desc",//排序方式,可选desc,asc
            mtype : "post",//向后台请求数据的ajax的类型。可选post,get
            viewrecords : true, //定义是否要显示总记录数
            // caption : "JSON Example"//表格的标题名字
        });
    /*创建jqGrid的操作按钮容器*/
    /*可以控制界面上增删改查的按钮是否显示*/
    jQuery("#list2").jqGrid('123', '#pager2', {edit : false,add : false,del : false});
    // jQuery("#list2").jqGrid('navGrid', '#pager2', {edit : true,add : true,del : true});


}




function showQList(e){
    var station_id=$(e).parent().attr('id');
    $("#stationId").val("");
    $("#d_qtype").empty();
    $("#d_score").empty();
    $("#d_from").empty();
    $("#dataList tbody ").remove();
    // $("#trtemplate").remove();

    iniSearchArea(station_id);
    $.ajax({
        type: 'POST',
        url: '${pageContext.request.contextPath}/question/findByStation.do',
        data:{'station_id':station_id, 'page':1,'size':1000},
        datatype: 'json',
        async: 'false',
        success: function (data) {
            // debugger;
            $("#trtemplate").cleanData;
            //1,获取上面id为trtemplate的tr元素
            var tr = $("#trtemplate");
            for (var i = 0; i < data.list.length; i++){
                var item = data.list[i];
                var items = tr.clone();
                //循环遍历trtemplate的每一个td元素，并赋值
                items.children("td").each(function (innerindex) {  <!--innerindex列序号，从0开始-->
                    switch (innerindex) {
                        case 0:
                            $(this).html("<input name=\"ids\" type=\"checkbox\">");
                            break;
                        case 1:
                            $(this).html(data.list.length-i);
                            break;
                        case 2:
                            $(this).html(item.qns);
                            break;
                        case 3:
                            $(this).html(data.list[i].station.name);
                            break;;
                        case 4:
                            $(this).html(data.list[i].qtype.name);
                            break;
                        case 5:
                            $(this).html(item.score);
                            break;
                        case 6:
                            $(this).html(data.list[i].owner.name);
                            break;
                        case 7:
                            $(this).html(item.filename);
                            break;
                        case 8:
                            $(this).html("                                            <td class=\"text-center\">\n" +
                                "                                                <button type=\"button\" class=\"btn bg-olive btn-xs\"\n" +
                                "                                                        onclick=\"location.href='${pageContext.request.contextPath}/question/findById.do?id=${questionLib.qid}'\">\n" +
                                "                                                    修改\n" +
                                "                                                </button>\n" +
                                "                                                <button type=\"button\" class=\"btn bg-olive btn-xs\">删除</button>\n" +
                                "                                            </td>");
                            break;
                    }

                });
                //把克隆好的tr追加原来的tr后面
                items.insertAfter(tr);
            }

        },
        error: function (data) {
            alert("error..........")
        }
    })

}