class ScientistsController < ApplicationController

    before_action :find_scientist, only: [:show, :update, :destroy]

    # GET /scientists
    def index
        scientists = Scientist.all
        render json: scientists
    end
    # GET /scientists/:id
    def show
        # we don't need to use find_by because we are only looking for an id
        render json: @scientist, serializer: ScientistPlanetSerializer
    end

    # POST /scientists
    def create
        scientist = Scientist.create!(scientist_params)
        render json: scientist, status: :created
    end

    # PATCH /scientists/:id
    def update
        @scientist.update!(scientist_params)
        render json: @scientist, status: :accepted
    end

    # DELETE /scientists/:id
    # Create a cascading destroy/dependent destroy so missions associated with the
    # scientist are destroyed before the scientist itself. We can do this through
    # the scientist.rb file.
    def destroy
        @scientist.destroy
        # "After deleting the Scientist, return an empty response body"
        # This head :no_content does exactly that.
        head :no_content
    end

    private
    # made scientist into an instance variable so it can be accessible to all other
    # actions.
    # Any action that is going to use this variable must be put in the before action
    # at the top.
    def find_scientist
        @scientist = Scientist.find(params[:id])
    end

    # determines what keys MUST be present in order for an instance of scientist to be
    # created or modified.
    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
