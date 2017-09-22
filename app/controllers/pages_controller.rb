class PagesController < ApplicationController
  
  def home
  end
  
  def about
  end
  
  def ref
  end

  def langue_fr
    $langue = "fr"
    redirect_to "/"
  end

  def langue_en
    $langue = "en"
    redirect_to "/"
  end
  
end
