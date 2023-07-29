class ResultsController < ApplicationController

  def index
    @results = Result.all
  end

  def new
    @result = Result.new
  end

  def create
    @result = Result.new(result_params)
    @result.answer = Faker::Quote.famous_last_words #Later will use main service

    respond_to do |format|
      if @result.save!
        format.turbo_stream do
          render(turbo_stream: turbo_stream.append('results', partial: 'results/result', locals: { result: @result }))
        end
      end
    end
  end

  private

  def result_params
    params.require(:result).permit(:question)
  end
end
