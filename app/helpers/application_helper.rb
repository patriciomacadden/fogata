module ApplicationHelper
  def gravatar_url(user, size = 80, rating = 'g', default = nil)
    gravatar_id = Digest::MD5.hexdigest user.email.downcase unless user.nil?
    
    params = Hash.new
    
    if size >= 1 && size <= 512
      params[:s] = size
    end
    
    if ['g', 'pg', 'r', 'x'].include?(rating)
      params[:r] = rating
    end
    
    if !default.nil?
      params[:d] = default
    end
    
    "http://gravatar.com/avatar/#{gravatar_id}.png?#{params.to_query}"
  end
  
  def emojize(text)
    text.gsub(/:\w+:/) do |s|
      img_path = "emojis/#{s.gsub(':', '')}.png"
      
      if FileTest.exist? "#{Rails.root}/app/assets/images/#{img_path}"
        image_tag img_path, class: 'emoji'
      else
        s
      end
    end
  end

  def replace_urls(text)
    text.gsub(/https?:\/\/[\S]+/) do |s|
      link_to s, s, target: '_blank'
    end
  end

  def messageize(text)
    text = emojize(text)
    text = replace_urls(text)
  end
  
  def title(page_title)
    content_for :title, page_title
  end
end
