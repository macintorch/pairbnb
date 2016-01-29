class Booking < ActiveRecord::Base
	validates_presence_of :check_in, :check_out
	belongs_to :user
	belongs_to :listing

	#to calculate day booked
	def day 
		(self.check_out - self.check_in).to_i
	end

	# Check if a given interval overlaps this interval    
   def overlaps?(other)
     (self.check_in - other.check_out) * (other.check_in - self.check_out) >= 0
   end

  # Return a scope for all interval overlapping the given interval, including the given interval itself
  # named_scope :overlapping, lambda { |interval| {
  #   :conditions => ["id <> ? AND (DATEDIFF(check_in, ?) * DATEDIFF(?, check_out)) >= 0", interval.id, interval.check_out, interval.check_in]
  # }}
end
