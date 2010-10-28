require 'httparty'
require 'json'

class DaqController
  include HTTParty
  format :json
  # default_params :output => 'json'
  
  def self.verify_apikey(opts)
    exec_get("verify", opts)
  end

  
  def self.status(opts)
    exec_get("status", opts)
  end
  

  def self.starting_gate_down(opts)
    exec_post("starting_gate_down", opts)
  end


  def self.starting_gate_up(opts)
    exec_post("starting_gate_up", opts)
  end


  def self.starting_gate_status(opts)
    exec_post("starting_gate_status", opts)
  end


  def self.start_race(opts)
    exec_post("start_race", opts)
  end

  
  private
  def self.exec_get(command, opts)
    t_in = Time.new
    result = get("http://#{opts[:host]}:#{opts[:port]}/#{command}", :query => {:apikey => opts[:apikey]})
    { :response => result.response,
      :result => (result.parsed_response),
      :elapsed => "#{(Time.new - t_in).round(4)}s" }
  rescue
    {:error => $!}
  end
  
  def self.exec_post(command, opts)
    t_in = Time.new
    result = post("http://#{opts[:host]}:#{opts[:port]}/#{command}", :body => {:apikey => opts[:apikey]})
    { :response => result.response,
      :result => (result.parsed_response),
      :elapsed => "#{(Time.new - t_in).round(4)}s" }
    rescue
      {:error => $!}
      
  end
end