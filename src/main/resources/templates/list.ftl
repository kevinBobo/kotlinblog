<html>
<head>
    <title>Blog!!!</title>
    <head>
        <title>Blog</title>
        <#include "common/head.ftl">
    </head>
</head>
<body>
<#include "common/navbar.ftl">
<a href="addArticleView" target="_blank" class="btn btn-primary pull-right add-article">写文章</a>
<div class="container">
    <h1>我的博客</h1>
    <table id="articlesDataTable" class="table table-responsive table-bordered">
        <thead>
        <th>序号</th>
        <th>标题</th>
        <th>作者</th>
        <th>发表时间</th>
        <th>操作</th>
        </thead>
        <tbody>
        <#-- 使用FTL指令 -->
        <#list articles as article>
        <tr>
            <td>${article.id}</td>
            <td><a target="_blank" href="detailArticleView?id=${article.id}">${article.title}</a></td>
            <td>${article.author}</td>
            <td>${article.gmtModified}</td>
            <td><a href="#" target="_blank">编辑</a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>
<script>
    var aLengthMenu = [7, 10, 20, 50, 100, 200]
    var dataTableOptions = {
        "bDestroy": true,
        dom: 'lfrtip',
        "paging": true,
        "lengthChange": true,
        "searching": true,
        "ordering": true,
        "info": true,
        "autoWidth": true,
        "processing": true,
        "stateSave": true,
        responsive: true,
        fixedHeader: false,
        order: [[1, "desc"]],
        "aLengthMenu": aLengthMenu,
        language: {
            "search": "<div style='border-radius:10px;margin-left:auto;margin-right:2px;width:760px;'>_INPUT_  <span class='btn btn-primary'><span class='fa fa-search'></span> 搜索</span></div>",

            paginate: {//分页的样式内容
                previous: "上一页",
                next: "下一页",
                first: "第一页",
                last: "最后"
            }
        },
        zeroRecords: "没有内容",//table tbody内容为空时，tbody的内容。
        //下面三者构成了总体的左下角的内容。
        info: "总计 _TOTAL_ 条,共 _PAGES_ 页，_START_ - _END_ ",//左下角的信息显示，大写的词为关键字。
        infoEmpty: "0条记录",//筛选为空时左下角的显示。
        infoFiltered: ""//筛选之后的左下角筛选提示
    }
    $('#articlesDataTable').DataTable(dataTableOptions)
</script>
</body>
</html>