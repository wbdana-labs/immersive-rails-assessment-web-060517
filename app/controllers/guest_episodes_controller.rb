class GuestEpisodesController < ApplicationController

  def new
    @guest_episode = GuestEpisode.new
    @guest = Guest.find(params[:format].to_i)
    @episodes = Episode.all
  end

  def create
    @guest_episode = GuestEpisode.create(guest_id: params[:id], episode_id: episode_id)
  end

end
