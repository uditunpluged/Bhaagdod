class RunnersController < ApplicationController

  def index
    @runners=User.with_role(:runner)
    @runner = User.new
  end

  def show
    @runner=User.find params[:id]
  end

  def edit
    @runner=User.find params[:id]
  end

  def update
    @runner=User.find params[:id]
    if @runner.update(post_params)
      redirect_to :back

    end
  end


  def new
    @runner=User.new
  end

  def create
    @runner=User.new(post_params)
    @runner.add_role(:runner)
    if @runner.save
      redirect_to :back
    else
      render 'new'
    end
  end


  def delete
    @runner=User.find params[:id]
  end

  def destroy
    @runner=User.find params[:id]
    @runner.destroy
    redirect_to :back
  end


  private

  def post_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone_no, :status)
  end

end
