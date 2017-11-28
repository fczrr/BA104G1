  <%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
  </div>
                    <div class="tab-pane fade" id="tab2" role="tabpanel">
                        目前點擊#tab2
                    </div>
                    <div class="tab-pane fade " id="tab3" role="tabpanel">
                        <br>
                        <br>
						<c:if test="${not empty errorMsgs}">
							<font color='red'>請修正以下錯誤:<br> <c:forEach
									var="message" items="${errorMsgs}">
						${message}<br>
								</c:forEach>

							</font>
						</c:if>
						<font size="5"><a href='listAllPro.jsp'>列出所有促銷專案by EL</a></font>
                        <br>
                        <br>
                        <form action="pro.do" class="form-inline" method="post">
                            <div class="form-group">
                                <font size="5">輸入促銷專案編號：</font>
                                <input class="form-control input" name="PRONO" placeholder="促銷專案NO." size="8" type="text">
                                <input name="action" type="hidden" value="getOne_For_Display3">
                                <button class="btn btn-primary btn" data-placement="top" data-toggle="tooltip" title="搜尋"><span class="glyphicon glyphicon-search"></span>查詢</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js">
    </script>
    <button class="btn btn-default" data-placement="top" data-toggle="tooltip" title="不要碰我" type="button">按鈕</button>
    <script>
    $(function() {
        $('[data-toggle="tooltip"]').tooltip();
    })
    </script>
</body>

</html>