namespace :daq_controller do
  desc "start the DAQ contoller web service"
  task :start do
    require 'rbconfig'
    WINDOZE = RbConfig::CONFIG['host_os'] =~ /mswin|mingw/
    MAC = RbConfig::CONFIG['host_os'] =~ /darwin|powerpc/
    UNIX = RbConfig::CONFIG['host_os'] =~ /linux/
    
    dir = File.expand_path(File.join(File.dirname(__FILE__),"../../daq_controller_test"))
    
    if MAC
      require 'appscript'
      @terminal = Appscript.app("Terminal")
      @terminal.do_script("cd #{dir}; rackup -p 8011")
    elsif WINDOZE
      sh "gnome-terminal --command cd #{dir}; rackup -p 8011"
    elsif UNIX
      sh "cd #{dir}; ruby rackup -p 8011"
    end
  end
end

