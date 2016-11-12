class CoordinatorsController < ApplicationController
  def index
    @coordinators=User.with_role(:coordinator)
  end

  def new
    @coordinator=User.new
  end

  def create
    @coordinator=User.new(post_params)
    @coordinator.add_role(:coordinator)
    if @coordinator.save
      redirect_to coordinators_path
    else
      redirect_to new_coordinator_path
    end
  end

  def edit
    @coordinator=User.find params[:id]
  end

  def update
    @coordinator=User.find params[:id]
    if @coordinator.update(post_params)
      redirect_to coordinators_path
    else
      redirect_to edit_coordinator_path
    end
  end

  def delete
    @coordinator=User.find params[:id]
  end

  def destroy
    @coordinator=User.find params[:id]
    @coordinator.team.update(user: nil)
    @coordinator.destroy
    redirect_to :back
  end


  def import
    User.importCoordinatorsUsingRoo(params[:file])
    redirect_to :back, :notice=>"Imported"
  end

  def post_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :phone_no,:team_id)
  end
end
