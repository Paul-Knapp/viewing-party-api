class Api::V1::ViewingPartiesController < ApplicationController
    def create
      required_params = [:name, :start_time, :end_time, :movie_id, :movie_title, :host_id, :invitees]
      missing_params = required_params.select { |param| params[param].blank? }
  
      if missing_params.any?
        return render json: { error: "Missing required parameters: #{missing_params.join(', ')}" }, status: :bad_request
      end
  
      host = User.find_by(id: params[:host_id])
      return render json: { error: "Host not found" }, status: :not_found if host.nil?
  
      viewing_party = ViewingParty.new(
        name: params[:name],
        start_time: params[:start_time],
        end_time: params[:end_time],
        movie_id: params[:movie_id],
        movie_title: params[:movie_title],
        host: host
      )
  
      if viewing_party.save
        valid_invitees = User.where(id: params[:invitees])
        valid_invitees.each do |user|
          ViewingPartyUser.create(viewing_party: viewing_party, user: user, is_host: (user == host))
        end

        render json: viewing_party_response(viewing_party, valid_invitees), status: :created
      else
        render json: { error: viewing_party.errors.full_messages.to_sentence }, status: :unprocessable_entity #.to_sentence is the coolest join ever.
      end
    end
  end

  