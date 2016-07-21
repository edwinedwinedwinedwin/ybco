class ProjectMilestone < ActiveRecord::Base
    belongs_to :project
    belongs_to :project_status	

	validates :name, :uniqueness => true, :presence => {:message => " cannot be blank"}, :on => :create
	validates :start_date, :presence => { :message => " cannot be blank" },:on => :create
	validates :end_date, :presence => { :message => " cannot be blank" },:on => :create

end

