
$(document).on('click', '.post-comment', function() {
  	
        var url = window.location.pathname;
        var product_id = url.substring(url.lastIndexOf('/') + 1);
        var comment_id = $(this).data('id');
    
        $.ajax({
          url: '/products/'+ product_id + '/comments',
          type: 'POST',
          dataType: 'json',
          data: {
            parent_id: $('.comment_parent_id').val(),
            product_id: $('.comment_product_id').val(),
            content: $('.comment_content').val()
         
          },
          success: function(data){
          	debugger
          	
            $('#append-comment').prepend(data.data_comment)
            $('#count-comment').replaceWith('('+data.count_comment+')')
            $('.comment_content').val("")
          },
          fail: function (){
		    alert( "error" );
			}			
        });
     
    });
	
		var url = window.location.pathname;
        var product_id = url.substring(url.lastIndexOf('/') + 1);
		$(document).ready(function(){
			$('.delete-comment').click(function(){
				debugger
				
				comment_id = $(this).data('id');
				var deleteComment = '#delete-comment'+comment_id;
				$('#append-comment-'+comment_id).remove();

			});	
			// update comment
			$('.edit-comment').click(function(){
				debugger

				comment_id = $(this).data('id');
				var editComment = '#edit'+comment_id;
				$.ajax({
					url: '/products/'+product_id+'/comments/'+comment_id,
					type: 'GET',
					_method: 'PATCH',
					success: function(){
						$('#edit-form'+comment_id).show();
						$('#comment_content'+comment_id).val('<%=comment.content %>');
				
					}
				})
			});	

			$(document).on('click','.update-comment', function(){
				debugger
	
					$.ajax({
					url: '/products/'+product_id+'/comments/'+comment_id,
					type: 'PUT',
					dataType: 'json',
					data:{
						product_id: $('#comment_product_id'+comment_id).val(),
						content: $('#comment_content'+comment_id).val()
					},
					success: function(data){
						$('#append-comment-'+comment_id).replaceWith(data.update_data_comment);
						alert('updated')
					}
				})
			});					
		});			
	

	
			$(document).ready(function(){
				$('.subcomment').click(function(){
					comment_id = $(this).data('id');
					Subcomment = '#subcomment'+ comment_id;
					$('.comment-subcomment-form'+ comment_id).show();	
				
				}) 
				
			$('.sub-comment').click(function(){
				 comment_id = $(this).data('id');
				 subComment = '#sub-comment'+comment_id

				debugger
					$.ajax({
						url:  '/comments/'+ comment_id +'/sub_comments',
						type: 'POST',
						dataType: 'json',
	          			data: {
			            	comment_id: $('#sub_comment_comment_id'+ comment_id).val(), 
			            	content: $('#sub_comment_content'+ comment_id).val()
			        	},
				        success: function(data){
				          	debugger			          	
				            $('#comment-'+ comment_id).prepend(data.data_comment_subcomment),
				            $('#sub_comment_content'+ comment_id).val(undefined)
				            $('.comment-subcomment-form'+ comment_id).hide()
				         }		         
					})
				});		
			});




