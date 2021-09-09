/* p.403 ~ p.404, p.407 */

const replyService = (function(){
	
	// 댓글 등록
	function add(callback, error) { 
		$.ajax({
			url: '../reply/',
			data: $('#replyForm').serialize(),
			method: 'POST',
			dataType: 'json',
			success: function(data){
				if(callback) callback(data);
			},
			error: function(){ if(error) error(); }
		});
	}
	
	
	// 목록 조회
	function getList(param, callback, error) {
	
		$.ajax({
			url: '../reply/',
			data: param,
			dataType: 'json',
			success: function(data){
				if(callback)
				// callback(data)
				callback(data.replyCnt, data);
			},
			error: function(){ if(error) error(); }		
		});		
	}
	

	return {add:add, getList:getList}
	
})();