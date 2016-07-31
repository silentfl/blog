module PostsHelper
  def tag_list(post)
    post.tag_list.map do |tag|
      link_to tag, url_for(controller: :tags, action: :show, id: tag)
    end
      .join(', ')
      .html_safe
  end
end
