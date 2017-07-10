class Guest < ApplicationRecord
  has_many :guest_episodes
  has_many :episodes, through: :guest_episodes

  def get_episodes
    @appearances = GuestEpisode.find_by(guest_id: self.id)
    @episodes = []
    if !@appearances == nil
      @appearances.each do |appearance|
        @appearance.episode_id.each do |ep_id|
          @episodes << Episode.find(ep_id)
        end
      end
    end
    @episodes
  end

end
