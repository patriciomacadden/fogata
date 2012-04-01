module ApplicationHelper
  def gravatar_url(user, size = 80, rating = 'g', default = nil)
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    
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
end
