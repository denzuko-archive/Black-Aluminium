class Announcement < ActiveRecord::Base
  def self.current_announcements(hide_time)
    @time = Time.now.strftime('%Y-%m-%d %H:%M:%S')
    with_scope :find => { :conditions => ["starts_at <= ? AND ends_at >= ?", @time, @time] } do
      if hide_time.nil?
        find(:all)
      else
        find(:all, :conditions => ["updated_at > ? OR starts_at > ?", hide_time, @time])
      end
    end
  end
end
