module CommentsHelper

  def comments_tree_for comments, product, comment_new
    safe_join(comments.map do |comment, nested_comments|
      render(comment, product: product,
        comment_new: comment_new) + tree(nested_comments, product)
    end)
  end

  def tree nested_comments, product
    unless nested_comments.empty?
      content_tag :div,
        comments_tree_for(nested_comments, product, Comment.new), class: "replies"
    end
  end
end

