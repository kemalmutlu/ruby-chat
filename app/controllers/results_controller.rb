class ResultsController < ApplicationController
  rescue_from(::EmptyMessageError) { |error| render_error(error) }
  rescue_from(::SmallLimitError) { |error| render_error(error) }

  def index
    @results = Result.all
    @popular_results = Result.popular_results
  end

  def new
    @result = Result.new
  end

  def create
    @result = Ask.new(result_params[:question]).fetch_result

    respond_to do |format|
      format.turbo_stream do
        render(turbo_stream: turbo_stream.append('results', partial: 'results/result', locals: { result: @result }))
      end
    end
  end

  def append_result
    # comes result_id from faq_question_controller.js
    id = params[:id]
    result = Result.find(id)

    respond_to do |format|
      format.json {
        render json: result.to_json, status: :ok
      }
    end
  end

  private

  def result_params
    params.require(:result).permit(:question)
  end

  def render_error(error)
    render(turbo_stream: turbo_stream.append('results', partial: 'results/bad_result', locals: {
      question: result_params[:question],
      error_message: error.message,
    }))
  end
end
