class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.create(guest_params)
    redirect_to @guest
  end

  def show
    @guest = Guest.find_by(id: params[:id])
    @guest_id = @guest.id
    @episodes = @guest.get_episodes
  end

  def add_episode
    @guest_episode = GuestEpisode.new
    @guest = Guest.find_by(id: params[:format].to_i)
    @episodes = Episode.all
    @guest_id = @guest.id
    render '/guests/add_episode'
  end

  def create_appearance
    @appear_params = params[:guest][:episode_ids].reject{|n| n == ""}.map{|n| n.to_i}
    @guest = Guest.find_by(id: params[:id].to_i)
    @appear_params.each do |episode_id|
      GuestEpisode.create(guest_id: @guest.id, episode_id: episode_id)
    end
    @guest.save
    # redirect_to show_params
    redirect_to guest_path(@guest)
  end


end
