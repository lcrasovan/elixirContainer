defmodule ShakespeareBrowserTest do
  use ExUnit.Case
  doctest ShakespeareBrowser

  test "to be or not to be" do
    assert 1 + 1 == 2
  end

  test "counting words in phrases" do
    #cummulating phrases - super text enters super test
    text = ["hey jude", "hey jude hey"]
    assert WordCount.text_count(text) == %{hey: 3, jude: 2}
  end

end
