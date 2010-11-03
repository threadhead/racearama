require 'rubygems'
require 'sinatra'
require 'json'
require 'logger'
require 'ap'

AUTH_KEY = "development"

configure do
  @@logger = Logger.new("daq_controller.log")
  # @@logger = nil
  @@gate_status = "down"
end

before do
  @remote_ip = request.env['REMOTE_ADDR'].to_s
  unless params.include?('apikey') && (params['apikey'] == AUTH_KEY)
    log "APIKEY Invalid: #{params['apikey'] || "no key submitted"}"
    halt 403
  end
end

get '/verify' do
  log "GET /verify"
  {:api_key_valid => true}.to_json
end

get '/status' do
  log "GET /status"
  {:status => "active"}.to_json
end


post '/start_race' do
  log "POST /starting_gate_down"
  
  { :status => "ok",
    :units => "miliseconds",
    :results => [ {:lane => 1, :time => Time.now.to_i/1000},
                  {:lane => 2, :time => Time.now.to_i/1000}
                ]
  }.to_json
end


post '/lane_status' do
  log "POST /lane_stauts"
  
  { :status => "ok",
    :lane_status =>
      (1..12).map {|n| {:lane => n, :status => "#{rand > 0.5 ? 'open' : 'closed'}"}}
    
  }.to_json
end


post '/starting_gate_down' do
  log "POST /starting_gate_down"
  @@gate_status = "down"
	{:status => "ok", :gate => "down"}.to_json
end


post '/starting_gate_up' do
  log "POST /starting_gate_up"
  @@gate_status = "up"
	{:status => "ok",:gate => "up"}.to_json
end


post '/starting_gate_status' do
  log "POST /starting_gate_status"
  if @@gate_status == "down"
    {:gate => "down"}.to_json
  else
    {:gate => "up"}.to_json
  end
end

def log(message)
  @@logger.info "#{@remote_ip} #{message}" if @@logger
end


class Logger
  def format_message(severity, timestamp, progname, msg)
  "[#{timestamp.strftime "%d %b %H:%M:%S"}] #{msg}\n"
  end
end


# MyApp.run!