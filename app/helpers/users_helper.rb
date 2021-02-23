module UsersHelper
  def created_events(all_created_events)
    return unless all_created_events.count.zero?

    render 'users/no_created_events'
  end
end
