defmodule ShakespeareBrowserTest do
  use ExUnit.Case
  doctest ShakespeareBrowser

  test "reading from file line by line into array" do

    text = []
    filename = "test/fixtures/hamlet.txt"
    if File.exists?(filename) do
      stream = File.stream!(filename, [:read, :utf8])
      text = Enum.reduce stream, text, fn(line, listing) ->
               [WordCount.process_line(line)] ++ [listing]
             end
      end
    assert WordCount.text_count(text) == %{answer: 1, stand: 1, there: 1, unfold: 1, yourself: 1, bernardo: 1, enter: 1, francisco: 1, "who's": 1}
  end

end
