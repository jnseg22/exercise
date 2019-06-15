<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


      <div id="source-modal" class="modal fade" tabindex='-1'>
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Modal title</h4>
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
              <pre contenteditable>처리가 완료되었습니다.</pre>
            </div>
            <div class="modal-footer">
            	<button type="button" class="btn-btn-info">Close</button>
            	<button type="button" class="btn-btn-default">Save changes</button>
            </div>
          </div>
        </div>
      </div>

    
    <script src="/resources/docs/_vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="/resources/docs/_vendor/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/resources/docs/_assets/js/custom.js"></script>
    
    <script>
		$(document).ready(function(){
			$('#dataTables-example').DataTable({
				responsive: true
			});
			$(".sidebar-nav")
				.attr("class", "sidebar-nav navbar-collapse collapse")
				.attr("aria-expanded", 'false')
				.attr("style", "height:1px");
		});
	</script>
    
  </body>
</html>