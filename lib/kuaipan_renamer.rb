require_relative "kuaipan_renamer/version"
require "colored"
require "shellwords"

module KuaipanRenamer

  def self.rename_recursively( root, opts={} )
    Walker.new( root, opts ).rename_recursively
  end

  class Walker

    attr_reader :root
    
    def initialize( root, dry_run: false )
      @root = root
      @dry_run = dry_run
    end

    def rename_recursively
      rename_folder root
    end

    def rename_folder( folder )
      #puts "glob: #{folder}"
      Dir.glob( "#{folder.shellescape}/*" ) do |f|
        #puts "  - " + f
        if File.directory? f
          #puts "folder #{f}"
          rename_folder f
        else
          rename_file f
        end
      end

      rename_file folder
    end

    def rename_file( file )
      dir, base = *File.split(file)
      new_name  = new_name_for base
      unless base == new_name
        fullpath = File.join dir, new_name
        puts "#{file.ljust(50).red} => #{fullpath.green}"
        unless @dry_run
          File.rename file, fullpath
        end
      end
    end

    def new_name_for file
      map = {
        "(" => "（",
        ")" => "）",
        "[" => "【",
        "]" => "】"
      }
      file.dup.tap do |f|
        map.each do |from, to|
          f.gsub!( from, to )
        end
      end
    end

  end

end
