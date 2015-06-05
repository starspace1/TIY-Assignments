class Post < ActiveRecord::Base
  has_many :comments

  def preview

    if(text.length < 100)
      text
    else
      text[0..99]
    end

  end

end
