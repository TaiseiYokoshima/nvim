local function my_hls()
   local hl = require("highlights")
   return hl[1], hl[2], hl[3], hl[4]
end


return {
  my_hls = my_hls,
}
