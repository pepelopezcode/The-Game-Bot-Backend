class WordleScoresController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        scores = WordleScore.all.order(score: :desc)
        render json: scores
    end

    def create 
        score = WordleScore.create(score_params)
        render json: score, status: :created
    end

    private

    def score_params
        params.permit(:score, :user_id)
    end
end
