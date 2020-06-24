class UnitsController < ApplicationController


  def new
    @user = User.find(params[:user_id])
    @analysis = @user.analysis
    @unit = @user.units.build
  end

  def create
    @user = User.find(params[:user_id])
    @unit = @user.units.build(units_params)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to user_analysis_show_path(@user) }
        flash[:success] = "units were successfully updated."
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @unit = @user.units.find_by(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @unit = @user.units.find_by(params[:id])

    respond_to do |format|
      if @unit.update(units_params)
        format.html { redirect_to user_analysis_show_path(@user) }
        flash[:success] = "units were successfully updated."
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def units_params
    params.require(:unit).permit(:dwelling_type, :floor_area, :number_of_dwellings, :price_per_unit_area, :user_id)
  end
end
