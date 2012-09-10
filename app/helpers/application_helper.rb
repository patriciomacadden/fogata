module ApplicationHelper
  def flash_name_to_bootstrap_alert(flash_name)
    case flash_name
      when :notice then :success
      when :alert then :error
      else flash_name
    end
  end

  def gravatar_url(email, size = 48, rating = 'g', default = nil)
    gravatar_id = Digest::MD5.hexdigest(email.downcase)
  
    params = []
    params << "s=#{size}" if !size.nil? && size.between?(1, 512)
    params << "r=#{rating}" if [ 'g', 'pg', 'r', 'x' ].include?(rating)
    params << "d=#{default}" unless default.nil?
  
    "http://gravatar.com/avatar/#{gravatar_id}.png?#{params.join('&')}"
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
end
