#!/usr/bin/env ruby

Dir.entries(".").each do |f|
  if f == "." || f == ".."
    next
  end
  cmd = "mkdir " + f + "/normal"
  `#{cmd}`
  cmd = "cp " + f + "/original/* " + f + "/normal/"
  `#{cmd}`
end
