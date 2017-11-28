<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

			
<!-- 回覆跳窗 ================================================================================ -->


<!-- line modal -->
<div class="modal fade" id="ansower" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            <h3 class="modal-title replyDetail" id="lineModalLabel">新增申訴</h3>
        </div>
        <div class="modal-body">
            
            <!-- content goes here -->
            <form>
              <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 訂單編號 : </label>
                <p id="complainIn" class="repComNo"><%-- ${carComplainVO.complainNo} --%></p>
              </div>
             <div class="form-group">
                <label for="complainNo" id="complainTi"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 訂購日期 : </label>
                <p id="complainIn" class="repComTime"><%-- ${sdf.format(carComplainVO.detailDate)} --%></p>
              </div>
               <hr>
              <div class="form-group">
                <label for="complainIntro" id="complainTi"><i class="fa fa-envelope fo-1x" aria-hidden="true"></i> 申訴內容 : </label>
               <textarea class="form-control newReplay foucsNOW" id="" rows="5" placeholder="請輸入回覆內容"></textarea>
              </div>

            </form>

        </div>
        <div class="modal-footer">
            <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                <div class="btn-group" role="group">
                    <button type="button" class="btn btn-danger" id="canelBtn" data-dismiss="modal" role="button">取消</button>
                </div>
                
				<div class="btn-group" role="group">
                    <button type="button" class="btn btn-warning" id="submit"role="button">送出</button>
               		<input type="hidden" name="action"     value="update"> 
                    <input type="hidden" name="complainNo" class="replyNoDe" value="${carComplainVO.complainNo}">
                </div>
            </div>
        </div>
    </div>
  </div>
</div>

<!-- 回覆跳窗 ================================================================================ -->






</body>
</html>