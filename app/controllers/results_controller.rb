class ResultsController < ApplicationController

  def index
    @results = Result.all
    @popular_results= Result.popular_results
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

  private

  def result_params
    params.require(:result).permit(:question)
  end
end
