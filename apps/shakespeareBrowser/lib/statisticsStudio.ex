defmodule StatisticsStudio do

  def getShakespearePieceWordStats(piece) do
    text = ShakespeareBrowser.getPieceText(piece)
    stat = WordCount.text_count(text)
    listStat = Map.to_list(stat)
    File.write!("data/hamlet.json", Poison.encode!(listStat), [:binary])
    Enum.sort listStat, &(elem(&1, 1) >= elem(&2,1))
  end

  def getShakespearePieceWordByRoleStats(piece, role) do
    text = ShakespeareBrowser.getPieceText(piece, role)
    stat = WordCount.text_count(text)
    listStat = Map.to_list(stat)
    Enum.sort listStat, &(elem(&1, 1) >= elem(&2,1))
  end

end
