depths = [0, 0]

File.open('modernC.tex','r').each do |line|
  case line
  when /^\\chapter\{/
    depths = [depths[0] + 1, 0]
    target = "c%02ds%02d" % depths
    File.open('_main.tex','a') { |file| file.puts "\\include{#{target}}" }
  when /^\\section\{/
    depths = [depths[0], depths[1] + 1]
    target = "c%02ds%02d" % depths
    File.open('_main.tex','a') { |file| file.puts "\\include{#{target}}" }
  end
  target = "c%02ds%02d" % depths
  File.open("#{target}.tex",'a') { |file| file.puts line }
end


