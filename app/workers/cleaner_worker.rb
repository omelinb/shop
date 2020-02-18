class CleanerWorker
  include Sidekiq::Worker

  def perform(id)
    Cart.find(id).destroy
  end
end
