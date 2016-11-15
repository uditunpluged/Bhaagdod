class TeamsController < ApplicationController
  def index
    @teams = Team.all
    #@runners = User.with_role(:runner)
  end

  def new
    @team =Team.new
  end

  def create
    @team = Team.new(post_params)

    if @team.save
      @user=User.find(@team.user_id)
      @user.update({:team_id=>@team.id})
      redirect_to teams_path
    else
      redirect_to new_team_path
    end
  end

  def edit
    @team = Team.find params[:id]
  end

  def update
    @team = Team.find params[:id]
    if @team.update(post_params)
      @user=User.find(@team.user_id)
      @user.update({:team_id=>@team.id})
      redirect_to teams_path
    else
      redirect_to edit_team_path
    end
  end

  def show
    @team = Team.find params[:id]
    @allrunners = User.with_role(:runner).where(:team_id => nil)
    @runners = User.with_role(:runner).where(team: @team)
  end

  def delete
    @team=Team.find params[:id]
  end

  def destroy
    @team=Team.find params[:id]
    User.where(team: params[:id]).update_all({:team_id => nil})
    @team.destroy
    redirect_to :back
  end

  def add_runners_to
    @team=Team.find params[:id]
    User.where(id: params[:runner_ids]).update_all({:team_id => @team.id})
    redirect_to :back
  end

  def remove_runner_from
    @team=Team.find params[:id]
    User.where(id: params[:runner_id]).update_all({:team_id => nil})
    redirect_to :back
  end

  private

  def post_params
    params.require(:team).permit(:name, :user_id)
  end

end
