# -*- encoding : utf-8 -*-
class PagesController < ApplicationController
  def home
	@titre = "MyColloc"
  end

  def contact
	@titre = "Contact"
  end

  def about
	@titre = "A propos"
  end

end
