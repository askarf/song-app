require "test_helper"

class SongsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/songs.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Song.count, data.length
  end

  test "show" do
    get "/songs/#{Song.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "album", "artist", "year", "created_at", "updated_at"], data.keys
  end

  test "create" do
    assert_difference "Song.count", 1 do
      post "/songs.json", params: { title: "test product", album: "1", artist: "image.jpg", year: 2012 }
    end
  end
  test "update" do
    product = Song.first
    patch "/songs/#{product.id}.json", params: { title: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["title"]
  end
  test "destroy" do
    assert_difference "Song.count", -1 do
      delete "/songs/#{Song.first.id}.json"
      assert_response 200
    end
  end
end
