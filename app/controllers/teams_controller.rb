class TeamsController < ApplicationController
  def index
    @teams=Team.all
  end

  def new
    @team =Team.new
  end

  def create
    @team =Team.new(post_params)

    if @team.save
      redirect_to teams_path
    else
      redirect_to new_team_path
    end
  end

  def edit
    @team=Team.find params[:id]
  end

  def update
    @team=Team.find params[:id]
    if @team.update(post_params)
      redirect_to teams_path
    else
      redirect_to edit_team_path
    end
  end

  def show
  end

  def delete
    @team=Team.find params[:id]
  end

  def destroy
    @team=Team.find params[:id]
    @team.destroy
    redirect_to :back
  end


  private

  def post_params
    params.require(:team).permit(:name,:user_id)
  end

end
