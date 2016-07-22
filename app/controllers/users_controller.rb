class UsersController < Clearance::UsersController
  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private
  def user_params
    params[Clearance.configuration.user_parameter] || Hash.new
  end


  def user_from_params
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    image = user_params.delete(:image)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.password = password
      user.image = image
    end
  end

end