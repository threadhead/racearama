require 'httparty'
require 'json'

class DaqController
  include HTTParty
  format :json
  # default_params output: 'json'

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


  def self.start_race(opts, duration=10)
    exec_post("start_race", opts, {'duration' => duration})
  end


  def self.test_lanes(opts)
    exec_post("lane_status", opts)
  end


  private
  def self.exec_get(command, opts, params={})
    t_in = Time.new
    result = get(command_address(command, opts), query: {apikey: opts[:apikey]}.merge(params))
    { response: result.response,
      result: (result.parsed_response),
      elapsed: elapsed(t_in) }
  rescue
    {error: $!}
  end


  def self.exec_post(command, opts, params={})
    t_in = Time.new
    result = post(command_address(command, opts), body: {apikey: opts[:apikey]}.merge(params))
    { response: result.response,
      result: (result.parsed_response),
      elapsed: elapsed(t_in) }
    rescue
      {error: $!}
  end


  def self.command_address(command, opts)
    if opts[:port].blank?
      "http://#{opts[:host]}/#{command}"
    else
      "http://#{opts[:host]}:#{opts[:port]}/#{command}"
    end
  end


  def self.elapsed(t_in)
    "#{(Time.new - t_in).round(4)}s"
  end
end
