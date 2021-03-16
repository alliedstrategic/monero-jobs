# frozen_string_literal: true

class PostingsController < ApplicationController
  include PostingsConcern

  before_action :set_posting, only: %i[show edit update destroy]

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:show]

  # GET /postings
  # GET /postings.json
  def index
    # this should not be available to an individual user.
    @postings = if current_user.is_admin
                  Posting.all
                else
                  Posting.where(
                    user_id: current_user.id,
                    coins: [cookies[:coin].presence] || ['xmr']
                  )
      end
  end

  # GET /postings/1
  # GET /postings/1.json
  def show; end

  # GET /postings/new
  def new
    @posting = Posting.new
  end

  # GET /postings/1/edit
  def edit; end

  # POST /postings
  # POST /postings.json
  def create
    @posting = Posting.new(posting_params)

    apply_type = check_apply_type(@posting.how_to_apply)

    if apply_type == 'invalid'
      redirect_to new_posting_path, flash: {
        error: 'Apply Type Invalid, please use full urls like this: https://www.google.com'
      } and return
    end

    @posting.user_id = current_user.id

    @posting.apply_type = apply_type

    @posting.coins << cookies[:coin].presence || 'xmr'

    respond_to do |format|
      if @posting.save
        format.html { redirect_to @posting, notice: 'Posting was successfully created.' }
        format.json { render :show, status: :created, location: @posting }
      else
        format.html { render :new }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postings/1
  # PATCH/PUT /postings/1.json
  def update
    apply_type = check_apply_type(posting_params['how_to_apply'])

    if apply_type == 'invalid'
      redirect_to edit_posting_path, flash: {
        error: 'Apply Type Invalid, please use full urls like this: https://www.google.com'
      } and return
    end

    @posting.apply_type = apply_type

    respond_to do |format|
      if @posting.update(posting_params)
        format.html { redirect_to @posting, notice: 'Posting was successfully updated.' }
        format.json { render :show, status: :ok, location: @posting }
      else
        format.html { render :edit }
        format.json { render json: @posting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postings/1
  # DELETE /postings/1.json
  def destroy
    @posting.destroy
    respond_to do |format|
      format.html { redirect_to postings_url, notice: 'Posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_posting
    @posting = Posting.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def posting_params
    params.fetch(:posting, {}).permit(
      :title,
      :category,
      :headquarters,
      :regional_restrictions,
      :how_to_apply,
      :description,
      :email,
      :posting_type,
      :content # trix editor content
    )
  end
end
