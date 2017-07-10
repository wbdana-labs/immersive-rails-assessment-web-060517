class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    @guest_eps = GuestEpisode.find_by(episode_id: params[:id])
    @guests = []
    if !@guest_eps.nil?
      @guest_eps.map do |guest_ep|
        guest_ep.guest_id
      end.each do |guest_id|
        @guests << Guest.find(guest_id)
      end
    end
    @guests
  end

end
