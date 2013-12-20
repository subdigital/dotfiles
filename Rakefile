require 'rubygems'
require 'rake'
require 'colored'

desc "Create symlinks for each of the files.  Prompts before overwriting"
task :symlink do
  create_symlinks
end

def all_files
  Dir.glob('.*')
end

def ignore_files
  [ '.DS_Store', '.git', '.gitignore', '.', '..' ]
end

def create_symlinks
  dir = File.dirname(__FILE__)

  (all_files - ignore_files).each do |file|
    homedir = File.expand_path ENV['HOME']
    source_path = File.join dir, file
    target_path = File.join homedir, file
    if File.exists?(target_path)
      puts "File #{target_path} exists.  Overwrite it (y/n)?"
      if STDIN.gets.chomp.downcase == 'y'
        puts "#{"DELETING".red} #{target_path}"
        raise "This shouldn't happen, but if it does, I'm refusing to delete /" if target_path == "/"
        FileUtils.rm_r(target_path)
      else
        puts "#{"SKIPPING".blue} #{target_path}"
        next
      end
    end

    puts "#{"[SYMLINK]".green} #{source_path} --> #{target_path.yellow}"
    FileUtils.ln_s(source_path, target_path)
  end

  puts
  puts "Done."
end
