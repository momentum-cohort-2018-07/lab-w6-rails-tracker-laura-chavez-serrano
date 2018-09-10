class NotesController < ApplicationController
    before_action :set_track, only: [:index,:show, :update, :destroy, :create]
    before_action :set_notes, only: [:show, :update, :destroy]

    # GET /notes dog.notes
    def index
      @notes = @dog.notes
  
      render json: @dog.notes
    end
  
    # GET /notes/1
    def show
      render json: @note
    end
  
    # POST /note
    def create
      @note = Note.create(
      notes: params {"notes"},
      dog_id: @dog.id
      )

        render json: @note
    end
  
    # PATCH/PUT /dogs/1
    def update
      if @note.update(note_params)
        render json: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /dogs/1
    def destroy
      @note.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_track
        @dog = Dog.find(params["track_id"])
      end
      def set_note
        @note = Note.find(params["id"])
      end
      
      # Only allow a trusted parameter "white list" through.
      def note_params
        params.require(:note).permit(:notes)
      end
end
