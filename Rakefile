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
  ['.DS_Store', '.git', '.gitignore', '.', '..']
end

def already_symlinked?(source_path, target_path)
  File.exist?(target_path) && File.lstat(target_path).symlink? && File.readlink(target_path) == source_path
end

def create_symlink(source, target)
  if File.exist?(target)
    puts "File #{target} exists.  Overwrite it (y/n)?"
    if $stdin.gets.chomp.downcase == 'y'
      puts "#{'DELETING'.red} #{target}"
      raise "This shouldn't happen, but if it does, I'm refusing to delete /" if target == "/"

      FileUtils.rm_r(target)
    else
      puts "#{'SKIPPING'.blue} #{target}"
      return
    end
  end

  puts "#{'[SYMLINK]'.green} #{source} --> #{target.yellow}"
  FileUtils.ln_s(source, target)
end

def create_symlinks
  dir = File.dirname(__FILE__)

  (all_files - ignore_files).each do |file|
    homedir = File.expand_path ENV['HOME']
    source_path = File.join dir, file
    target_path = File.join homedir, file
    next if already_symlinked?(source_path, target_path)

    create_symlink(source_path, target_path)
  end

  puts
  puts "Done."
end
