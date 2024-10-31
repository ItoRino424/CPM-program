class RankingsController < ApplicationController
    def index
        @rankings = Ranking.order(score: :desc)
        @rankings = Ranking.group(:user_id).sum(:score).sort_by { |_, total_score| -total_score }
    end
    
      def create
        @ranking = current_user.rankings.new(score: params[:score])
    
        if @ranking.save
          redirect_to rankings_path, notice: 'Your score was added to the ranking.'
        else
          redirect_to rankings_path, alert: 'Failed to add your score to the ranking.'
        end
      end
end
