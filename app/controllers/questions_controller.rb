class QuestionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:answer]
  def ask
  end

  def answer
    @question = params[:question]
    @answer = coach_response(@question)
  end

  private

  def coach_response(question)
    if question.nil? || question.empty?
      "Please ask a question."
    elsif question == "I am going to work"
      "Great!"
    elsif question.end_with?("?")
      "Silly question, get dressed and go to work!"
    else
      "I don't care, get dressed and go to work!"
    end
  end
end
