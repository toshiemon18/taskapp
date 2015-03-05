class ProjectsController < ApplicationController

	# アクションで重複してる動作をまとめる
	# before_actionで出来る
	# after_actionもあるよ
	before_action :set_project , only: [:show, :edit, :update, :destroy]

	def index 
		@projects = Project.all
	end

	def show
	end

	def new
		@projects = Project.new
	end

	def create
		@projects = Project.new(project_title)
		if @projects.save then
			redirect_to projects_path
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @projects.update(project_title)
			redirect_to projects_path
		else
			render "edit"
		end
	end

	def destroy
		@projects.destroy
		redirect_to projects_path
	end

	# セキュリティ上の計らい
	private
		def project_title
			params[:project].permit(:title)
		end

		def set_project
			@projects = Project.find(params[:id])
		end

end
