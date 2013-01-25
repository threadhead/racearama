class SettingsController < ApplicationController
  def update
    @setting = Setting.find(params[:id])

    if @setting.update_attributes(params[:setting].except(:return_to))
      flash[:notice] = "Successfully updated scout."
    end

    if params["setting"][:return_to]
      redirect_to( :controller => params["setting"][:return_to].split("#").first,
                   :action => params["setting"][:return_to].split("#").last )
    end
  end

end
