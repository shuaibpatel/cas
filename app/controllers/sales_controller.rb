class SalesController < ApplicationController

  def index
  end

  def report
    ReportWorker.perform_async("07-01-2016", "08-01-2016")
    render text: "REQUEST ADDED TO QUEUE"
  end

  private
  def generate_report
    sleep 30
  end

end