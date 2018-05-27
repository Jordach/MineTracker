love.graphics.setBackgroundColor(0.2, 0.2, 0.2)
love.window.setTitle("MineTracker Player")
love.window.setMode(600,1)
path = love.filesystem.getSource()

love.filesystem.setIdentity("loveplayer")

trackdata = {}

tool = {}

function tool.deserialize(str, safe)
	if type(str) ~= "string" then
		return false
	end

	local f, err = loadstring(str)
	
	if not f then return false end

	local good, data = pcall(f)
	
	if good then
		return data
	else
		return nil, data
	end

end

local function decode_track(filename)

	for line in io.lines(path .. filename .. ".mtr") do

		if #trackdata < 4 then 
			trackdata[#trackdata + 1] = line
		else
			trackdata[#trackdata + 1] = tool.deserialize(line) 
		end

	end

	love.window.setTitle(trackdata[1] .. ", by " .. trackdata[2] .. ", " .. trackdata[3] .. ", at " .. trackdata[4] .. " BPM.")

end

local function play_track()

	for k, v in pairs(trackdata) do

		if k > 4 then

			for k2, v2 in pairs(v) do
				
				if k2 == "gap" then
					-- skip the audio engine
					
					love.timer.sleep(((60 / trackdata[4]) / 4))

				else
					
					local tbl = {
						gain = trackdata[k][k2].vol,
						fade = trackdata[k][k2].fade,
						pitch = trackdata[k][k2].pitch,
						sample = trackdata[k][k2].sample
					}

					local audio = love.audio.newSource(tbl.sample .. ".ogg", "static")

					audio:setVolume(tbl.gain)
					audio:setPitch(tbl.pitch)
					audio:play()

					love.timer.sleep(((60 / trackdata[4]) / 4))

				end

			end

		end

	end

end

local function save_track(filename)

end

decode_track("playback")

play_track()

function love.keypressed(k)

	if k == "space" then
		play_track()
	end

	if k == "escape" then
		love.event.quit()
	end
end

