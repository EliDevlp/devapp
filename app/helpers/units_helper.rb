module UnitsHelper
  def sum(field)
    @user = User.find(params[:user_id])
    @units = @user.units
    @units.sum(field)
  end
end
