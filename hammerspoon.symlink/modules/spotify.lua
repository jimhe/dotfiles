local hotkey = require 'hs.hotkey'

local function module_init()
    hotkey.bind(config:get('spotify.mash', { "ctrl", "alt", "cmd"}), config:get('spotify.show', 'space'), function()
      local album = hs.spotify.getCurrentAlbum()
      local artist = hs.spotify.getCurrentArtist()
      local track = hs.spotify.getCurrentTrack()
      local info = string.format("%s by %s\non %s", track, artist, album)
      if hs.spotify.getPlaybackState() == hs.spotify.state_playing then
        hs.alert.show(info, 4)
      end
    end)
end

return {
    init = module_init
}
