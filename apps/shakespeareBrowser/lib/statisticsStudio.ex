defmodule StatisticsStudio do

  def getShakespearePieceWordStats(piece) do
    text = ShakespeareElasticBrowser.getPieceText(piece)
    stat = WordCount.text_count(text)

    listStat = Map.to_list(stat)
    Enum.sort listStat, &(elem(&1, 1) >= elem(&2,1))
  end

end
