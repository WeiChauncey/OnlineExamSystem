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
            datatype : "json",//请求数据返回的类型。可选 json,xml,txt
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
            sortname : 'tax',//初始化的时候排序的字段
            sortorder : "asc",//排序方式,可选desc,asc
            mtype : "post",//向后台请求数据的ajax的类型。可选post,get
            viewrecords : true, //定义是否要显示总记录数
        // loadonce : true,


        // autowidth: true,
        // altRows: true,
        // altclass: 'altClass',
        //
        // shrinkToFit: false,
        // autoScroll: false,
        // resizable: true,
        loadonce: true,//一次加载全部数据到客户端，由客户端进行排序。
        // rownumbers: true
            // caption : "JSON Example"//表格的标题名字
        });
    /*创建jqGrid的操作按钮容器*/
    /*可以控制界面上增删改查的按钮是否显示*/
    // jQuery("#list2").jqGrid('navGrid', '#pager2', {edit : false,add : false,del : false});
    /*可以控制界面上显示搜索框*/
    jQuery("#list2").jqGrid('filterToolbar', {stringResult: true, searchOnEnter: false, defaultSearch : "cn"});
    // jQuery("#list2").jqGrid('navGrid', '#pager2', {edit : true,add : true,del : true});


}