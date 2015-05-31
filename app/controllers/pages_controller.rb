class PagesController < ApplicationController
  def index
  	@exchanges = Exchange.where("registration_end > :now AND registration_start <= :now", { now: DateTime.now })

    respond_to do |format|
      format.html
      format.json { render json: @exchanges }
    end
  end

  def dashboard
      @photo = Photo.new
  	  @myExchangeProfiles = ExchangeProfile.all.select { |e| e.user_id ==  current_user.id }
  	  @myExchanges = []
      for event in @myExchangeProfiles
      	item = Exchange.find_by(id: event.exchange_id) #use find by to avoid not found exception
      	if(item != nil)
        	@myExchanges.append(item)
        end
      end

  end
  
end
