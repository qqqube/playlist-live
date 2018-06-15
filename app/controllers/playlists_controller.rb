class PlaylistsController < ApplicationController

	def new
		@playlist = Playlist.new
		@playlist.manager_id = params[:manager_id]
		render 'new_playlist_form'
	end


	def create
		@playlist = Playlist.create(manager_id: params[:manager_id])
		@playlist.update(params.require(:playlist).permit(:join_name, :join_password))
		@playlist.curr_index = 0
		@playlist.active = true
		@playlist.save
		@admin = User.find(@playlist.manager_id)
		@admin.playlists << @playlist
		@playlist.users << @admin
		#render 'playlist_page'
		redirect_to playlist_path(id: @playlist.id, user_id: @admin.id)
	end

	def join
		$requester = User.find(params[:user_id])
		render 'join_form'
	end

	def grant_access
		form_name = params[:join_name]
		form_pass = params[:join_password]
		@playlist = Playlist.where("join_name = :join_name and join_password = :join_password", {join_name: form_name, join_password: form_pass }).first
		if @playlist.nil?
			flash[:error] = "Incorrect join name or password. Please try again."
			render 'join_form'
			
		else
			#render 'playlist_page'
			#@tempUser = @playlist.users.where(id: $requester.id).first
			@tempUser = @playlist.users.where("user_id = :user_id and playlist_id = :playlist_id", {user_id: $requester.id, playlist_id: @playlist.id}).first

			if not @tempUser.present?
				@playlist.users << $requester
			end
		redirect_to playlist_path(id:@playlist.id, user_id: $requester.id)
		end
	end

	def show
		@playlist = Playlist.find(params[:id])
		$user = User.find(params[:user_id])
		if @playlist.manager_id.eql?($user.id)
			$isAdmin = true
		else
			$isAdmin = false
		end
		render 'playlist_page'
	end

end




