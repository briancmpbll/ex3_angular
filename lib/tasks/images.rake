namespace :images do
  desc 'Generate all icon sizes from svgs in vectors'
  task :icons do
    export_dir = 'app/assets/images/'

    Dir.glob('vectors/*.svg').each do |file|
      base = File.basename(file, '.svg')

      [16, 24, 32, 48].each do |x|
        `inkscape --export-png #{export_dir}#{base}#{x}.png -w #{x} #{file}`
      end
    end
  end
end

desc 'Generate all images'
task images: ['images:icons']
