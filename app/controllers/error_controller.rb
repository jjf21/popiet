class ErrorsController < ApplicationController
  def error404
    authorize true
    render status: :not_found
  end
end