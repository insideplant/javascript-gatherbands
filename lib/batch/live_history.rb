class Batch::LiveHistory
  def self.live_history
    live = Live.find_by(status: "waiting_live")
    if live.start_at == Date.current.strftime
      live.update(status: "finish_live")
      puts "liveは終了しました"
    else
      puts "まだ開始されておりません"
    end
  end
end
