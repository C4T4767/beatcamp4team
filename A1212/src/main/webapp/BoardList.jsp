<%@ page import="kr.bit.bean.BoardBean" %>
<%@ page import="kr.bit.bean.BoardDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2>전체 게시글</h2>
    <%
        //화면에 보여질 게시글의 개수 지정
        int pageSize=10;
        //현재 클릭한 번호값(index)을 읽어옴
        String pageNum=request.getParameter("pageNum");

        if(pageNum==null){  //기본값으로 세팅하는 법
            pageNum="1";
        }
        int number=0; //페이지 넘버링
        int count=0;

        BoardDAO bdao = new BoardDAO();
        count=bdao.getAllcount(); //전체 게시글 개수 읽어옴

        int currentPage = Integer.parseInt(pageNum); //현재 페이지 인덱스 번호
        int startRow = (currentPage-1) * pageSize + 1;
        int endRow = currentPage * pageSize;

        Vector<BoardBean> vec= bdao.allBoard(startRow,pageSize);

        number=count-(currentPage-1) * pageSize;
    %>

    <table width="800" border="1">
        <tr height="40">
            <td width="50" align="center">번호</td>
            <td width="420" align="center">제목</td>
            <td width="100" align="center">작성자</td>
            <td width="150" align="center">작성날짜</td>
            <td width="80" align="center">조회수</td>
        </tr>
        <%
            for(int i=0; i<vec.size();i++){
                BoardBean bean=vec.get(i);
        %>
        <tr height="40">
            <td width="50" align="center"><%=number--%></td>
            <td width="50" align="center">
            <a href="BoardIn.jsp?num=<%=bean.getNum()%>"
               style="text-decoration:none"/>

            <%
                if(bean.getRe_step() > 1){
                    for(int j=0; j<(bean.getRe_step()-1)*5; j++){
            %> &nbsp;&nbsp;
            <%
                    }
                }
            %>
                <%=bean.getSubject()%></td>
            <td width="50" align="center"><%=bean.getWriter()%>  </td>
            <td width="50" align="center"><%=bean.getReg_date()%>  </td>
            <td width="50" align="center"><%=bean.getReadcount()%>  </td>

        </tr>



        <%
            }
        %>

        <tr height="40">
            <td align="center" colspan="5">
                <input type="button" value="글작성" onclick="location.href='index.jsp'">
            </td>
        </tr>
    </table>
    <%
        if(count > 0){
            int pageCount = count/pageSize + (count % pageSize == 0? 0:1);
            int startPage = 1;

            if(currentPage % 10 != 0){
                startPage = (int)(currentPage/10) * 10+1;
            }
            else{
                startPage = ((int)(currentPage/10)-1)*10+1;
            }
            int pageBlock=10;

            int endPage = startPage + pageBlock -1;

            if(endPage > pageCount)
                endPage=pageCount;

            if(startPage>10){
    %>
            <a href="BoardList.jsp?pageNum=<%=startPage-10%>">[이전]</a>
    <%
            }
            for(int i=startPage; i<=endPage; i++){
    %>
            <a href="BoardList.jsp?pageNum=<%=i %>">[<%=i%>]</a>
    <%
            }
            if(endPage<pageCount){
    %>

        <a href="BoardList.jsp?pageNum=<%=startPage+10%>">[다음]</a>
    <%
            }
        }
    %>
</center>
</body>
</html>
